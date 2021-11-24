output "subnet_ids-us-east-1" {
    value = "${module.VPC-us-east-1.subnet_ids}"
}

output "subnet_ids-eu-west-2" {
    value = "${module.VPC-eu-west-2.subnet_ids}"
}

# output "cluster_name" {
#     value = "${module.EKS-us-east-1.cluster_name}"
# }

# output "cluster_endpoint" {
#     value = "${module.EKS-us-east-1.cluster_endpoint}"
# }

