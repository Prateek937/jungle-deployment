output "vpc_id" {
    value = aws_vpc.vpc.id
}

output "subnet_public_ids" {
    value = [ for subnet in "${module.subnet_public}" : subnet.subnet_id]
}

output "subnet_private_ids" {
  value = [for subnet in "${module.subnet_private}" : subnet.subnet_id]
}