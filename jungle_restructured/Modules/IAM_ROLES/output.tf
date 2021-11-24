output "role_arn_master" {
    value = "${module.iam_role_master.role_arn_master}"
}

output "role_arn_node_group" {
    value = "${module.iam_role_node_groups.role_arn_node_group}"
}
