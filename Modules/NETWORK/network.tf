# VPC
# Subnets
# Internet Gateway
# Route Table

resource "aws_vpc" "jungle_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = tomap({
    "Name" = "terraform-eks-demo-node",
  })
}

resource "aws_subnet" "jungle_subnet" {
  count = 2

  availability_zone       = var.availability_zone[count.index]
  cidr_block              = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.jungle_vpc.id

  tags = tomap({
    "Name"                                      = "terraform-eks-demo-node",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared",
  })
}

resource "aws_internet_gateway" "jungle_igw" {
  vpc_id = aws_vpc.jungle_vpc.id

  tags = {
    Name = "jungle-eks-igw"
  }
}

resource "aws_route_table" "jungle_route_table" {
  vpc_id = aws_vpc.jungle_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jungle_igw.id
  }
}

resource "aws_route_table_association" "jungle_route_table_association" {
  count = 2

  subnet_id      = aws_subnet.jungle_subnet.*.id[count.index]
  route_table_id = aws_route_table.jungle_route_table.id
}
