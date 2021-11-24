resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = tomap({
    "Name" = "${var.tags.Name}",
    Solution = "${var.tags.Solution}"
    Stage = "${var.tags.Stage}"
  })
}

module "subnet_public" {
  source = "./SUBNET_PUBLIC"
  vpc_id = aws_vpc.vpc.id
  for_each = tomap(var.subnets["public"])
  availability_zone       = each.value["availability_zone"]
  cidr_block              = each.value["cidr_block"]
  assign_public_ip        = each.value["map_public_ip_on_launch"]
  tags                    = var.tags
  index                   = "${index(keys(var.subnets["public"]), each.key) + 1}"
}

module "subnet_private" {
  source = "./SUBNET_PRIVATE"
  vpc_id = aws_vpc.vpc.id
  for_each = tomap(var.subnets["private"])
  availability_zone       = each.value["availability_zone"]
  cidr_block              = each.value["cidr_block"]
  assign_public_ip        = each.value["map_public_ip_on_launch"]
  tags                    = var.tags
  index                   = "${index(keys(var.subnets["private"]), each.key) + 1}"
}

module "internet_gateway" {
  source = "./IGW"
  vpc_id = aws_vpc.vpc.id
  #eks_cluster_name = var.eks_cluster_name
  tags = var.tags
}

module "nat_gateway" {
  source = "./NAT"
  subnet_id = [ for subnet in "${module.subnet_public}" : subnet.subnet_id][0]
  tags = var.tags
}

module "route_tables" {
  source = "./ROUTE_TABLE"
  vpc_id = aws_vpc.vpc.id
  # eks_cluster_name = var.eks_cluster_name
  internet_gateway_id = "${module.internet_gateway.internet_gateway_id}"
  nat_gateway_id = "${module.nat_gateway.nat_gateway_id}"
  subnets = var.subnets
  tags = var.tags
}

module "route_table_association_public" {
  source = "./ROUTE_TABLE_ASSOCIATION"
  route_table_id = "${module.route_tables.public_route_table_id[0]}"
  count = length([ for subnet in "${module.subnet_public}" : subnet.subnet_id])
  subnet_id = [ for subnet in "${module.subnet_public}" : subnet.subnet_id][count.index]
}

module "route_table_association_private" {
  source = "./ROUTE_TABLE_ASSOCIATION"
  route_table_id = "${module.route_tables.private_route_table_id[0]}"
  count = length([ for subnet in "${module.subnet_private}" : subnet.subnet_id])
  subnet_id = [ for subnet in "${module.subnet_private}" : subnet.subnet_id][count.index]
}