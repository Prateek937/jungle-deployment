output "public_route_table_id" {
    value = aws_route_table.route_table_public.*.id
}

output "private_route_table_id" {
  value = aws_route_table.route_table_private.*.id
}