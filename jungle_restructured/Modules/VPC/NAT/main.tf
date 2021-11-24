resource "aws_nat_gateway" "nat_gateway" {
  connectivity_type = "private"
  subnet_id         = var.subnet_id
  tags = var.tags
}