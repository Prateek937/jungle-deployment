module "eks_cluster" {
  source = "./EKS_MASTER"
  eks_cluster_name = "${var.tags.Name}"
  vpc_id = var.vpc_id
  role_arn_master = var.role_arn_master
  subnet_ids = var.subnet_ids
  security_groups = var.security_groups
  tags = var.tags

}

# module "node_group" {
#   source = "./NODE_GROUP"
#   node_group_count = var.count
#   role_arn_node_group = var.role_arn_node_group
#   eks_cluster_name = "${module.eks_cluster.eks_cluster_name}"
#   subnet_ids =  var.subnet_ids
#   instance_types = var.instance_types
#   desired_size = var.desired_size
#   tags = var.tags
# }

