resource "aws_vpc" "jungle_vpc" {
  cidr_block = var.vpc_cidr
  
  tags = tomap({
    "Name" = var.vpc_name,
  })
}

module "subnet" {
  source = "./SUBNET"
  vpc_id = aws_vpc.jungle_vpc.id
  cluster_name = var.cluster_name
  for_each = var.subnets
  availability_zone       = each.value["availability_zone"]
  cidr_block              = each.value["cidr_block"]
  assign_public_ip        = each.value["map_public_ip_on_launch"]
}

# module "internet_gateway" {
#   source = "./IGW"
#   vpc_id = aws_vpc.jungle_vpc.id
# }

# module "route_table" {
#   source = "./ROUTE_TABLE"
#   vpc_id = aws_vpc.jungle_vpc.id
#   internet_gateway_id = "${module.internet_gateway.internet_gateway_id}"
# }

# module "route_table_association" {
#   source = "./ROUTE_TABLE_ASSOCIATION"
#   route_table_id = "${module.route_table.route_table_id}"
#   subnet_ids = "${module.subnet.subnet_ids}"
# }