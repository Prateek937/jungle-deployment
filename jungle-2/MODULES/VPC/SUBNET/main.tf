resource "aws_subnet" "jungle_subnet" {
  availability_zone = var.availability_zone
  cidr_block = var.cidr_block
  map_public_ip_on_launch = var.assign_public_ip
  vpc_id                  = var.vpc_id

  tags = tomap({
    "Name"                                      = "terraform-eks-demo-subnet",
    "kubernetes.io/cluster/${var.cluster_name}" = "shared",
  })
}