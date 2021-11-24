module "security_group" {
  source = "./SECURITY_GROUP"
  vpc_id = var.vpc_id
  for_each = var.security_groups
  # This arguement can be removed
  #security_group_name = "${var.tags.Name}-${index(keys(var.security_groups), each.key) + 1}"
  security_group_name = "sdgdg"
  rules = each.value
  tags = var.tags
  index = "${index(keys(var.security_groups), each.key) + 1}"
}

# module "eks_cluster" {
#   source = "./EKS_CLUSTER"
#   eks_cluster_name = var.eks_cluster_name
#   role_arn_master = var.role_arn_master
#   security_group_ids = [ for sg in "${module.security_group}" : sg.security_group_id]
#   subnet_ids = var.subnet_ids
#   tags = var.tags
# }