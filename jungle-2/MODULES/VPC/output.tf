output "vpc_id" {
    value = aws_vpc.jungle_vpc.id
}

output "subnet_ids" {
    value = [ for subnet in "${module.subnet}" : subnet.subnet_id]
}
