resource "aws_route_table_association" "jungle_route_table_association" {
  count = 2

  subnet_id      = var.subnet_ids[count.index]
  route_table_id = var.route_table_id
}
