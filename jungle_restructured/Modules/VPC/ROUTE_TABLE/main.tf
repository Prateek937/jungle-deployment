resource "aws_route_table" "route_table_public" {
  count = "${length(var.subnets["public"]) == 0 ? 0 : 1}"
  vpc_id = var.vpc_id

  #for public subnet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "${var.tags.Name}-Public"
    Solution = "${var.tags.Solution}"
    Stage = "${var.tags.Stage}" 
  }
}

resource "aws_route_table" "route_table_private" {
  count = "${length(var.subnets["private"]) == 0 ? 0 : 1}"
  vpc_id = var.vpc_id

  #for public subnet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "${var.tags.Name}-Private"
    Solution = "${var.tags.Solution}"
    Stage = "${var.tags.Stage}" 
  }
}