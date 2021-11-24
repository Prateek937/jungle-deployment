####################
# GLOBAL RESOURCES #
####################

# module "iam_roles" {
#   source                    = "../../Modules/IAM_ROLES"
#   iam_role_master_name      = "jungle-eks-master-role"
#   iam_role_node_group_name  = "jungle-eks-node-group-name"
# }

###########################################################3333

module "VPC-us-east-1" {
  source            = "../../Modules/VPC"
  availability_zone = var.availability_zone["us-east-1"]
  eks_cluster_name  = var.eks_cluster_name["us-east-1"]
  vpc_cidr          = var.vpc_cidr["us-east-1"]
  subnets           = var.subnets["us-east-1"] 
  providers         = {
    aws = aws
  }
}


module "VPC-eu-west-2" {
  source            = "../../Modules/VPC"
  availability_zone = var.availability_zone["eu-west-2"]
  eks_cluster_name  = var.eks_cluster_name["eu-west-2"]
  vpc_cidr          = var.vpc_cidr["eu-west-2"]
  subnets           = var.subnets["eu-west-2"]
  providers         = {
    aws = aws.eu-west-2
  }

}

module "VPC_PEERING" {
  source = "../../Modules/VPC_PEERING"
  peer_id = "${module.VPC-eu-west-2.vpc_id}"
  vpc_id = "${module.VPC-us-east-1.vpc_id}"
  peer_region = var.regions["eu-west-2"]
  providers = {
    aws = aws
    aws.eu-west-2 = aws.eu-west-2
  }
}

# module "EKS-us-east-1" {
#   source              = "../../Modules/EKS"
#   region              = "us-east-1"
#   eks_cluster_name    = var.eks_cluster_name["us-east-1"]
#   vpc_id              = "${module.VPC-us-east-1.vpc_id}"
#   role_arn_master     = "${module.iam_roles.role_arn_master}"
#   subnet_ids          = "${module.VPC-us-east-1.subnet_ids}"
#   security_groups     = var.security_groups["us-east-1"]
#   node_group_name     = var.node_group_name["us-east-1"]
#   role_arn_node_group = "${module.iam_roles.role_arn_node_group}"
#   desired_size        = var.desired_size["us-east-1"]
#   instance_types      = var.instance_types["us-east-1"]
#   providers           = {
#     aws = aws
#   }
# }


