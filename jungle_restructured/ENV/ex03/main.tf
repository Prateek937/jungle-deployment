####################
# GLOBAL RESOURCES #
####################

module "iam_roles" {
  source = "../../Modules/IAM_ROLES"
  iam_role_master_name = "jungle-eks-master-role"
  iam_role_node_group_name  = "jungle-eks-node-group-name"
}


module "VPC" {
  source = "../../Modules/VPC"
  availability_zone = var.availability_zone
  cluster_name = var.cluster_name
  assign_public_ip = var.assign_public_ip

}

module "EKS" {
  source = "../../Modules/EKS"
  cluster_name = var.cluster_name
  role_arn_iam_role_node_group_name =  = "${module.iam_roles.role_arn_node_group}"
  role_arn_master  = "${module.iam_roles.role_arn_master}"
  subnet_ids = "${module.VPC.subnet_ids}"
  vpc_id = "${module.VPC.vpc_id}"
  number_of_rules = var.number_of_rules
  cidr_blocks = var.cidr_blocks
  rule_description = var.rule_description
  from_port = var.from_port
  to_port = var.to_port
  rule_type = var.rule_type
  protocol = var.protocol
  node_group_name = var.node_group_name
  desired_size = var.desired_size
}