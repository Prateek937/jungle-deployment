resource "aws_subnet" "subnet_public" {
  availability_zone = var.availability_zone
  cidr_block = var.cidr_block
  map_public_ip_on_launch = var.assign_public_ip
  vpc_id                  = var.vpc_id
  
  tags = tomap({
    Name = "${var.tags.Name}-Public-${var.index}"
    Solution = "${var.tags.Solution}"
    Stage = "${var.tags.Stage}" 
  })
}

