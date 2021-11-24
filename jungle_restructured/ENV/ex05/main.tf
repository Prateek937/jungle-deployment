####################
# GLOBAL RESOURCES #
####################

module "iam_roles" {
  source                    = "../../Modules/IAM_ROLES"
  tags = local.tags
}

###########################################################


module "VPC-us-east-1" {
  source            = "../../Modules/VPC"
  availability_zone = var.availability_zone["us-east-1"]
  vpc_cidr          = var.vpc_cidr["us-east-1"]
  subnets           = var.subnets["us-east-1"] 
  tags              = local.tags
  providers         = {
    aws = aws
  }
}


# module "VPC-eu-west-2" {
#   source            = "../../Modules/VPC"
#   availability_zone = var.availability_zone["eu-west-2"]
#   vpc_cidr          = var.vpc_cidr["eu-west-2"]
#   subnets           = var.subnets["eu-west-2"]
#   tags              = local.tags
#   providers         = {
#     aws = aws.eu-west-2
#   }
# }

# module "VPC-ap-south-1" {
#   source            = "../../Modules/VPC"
#   availability_zone = var.availability_zone["ap-south-1"]
#   vpc_cidr          = var.vpc_cidr["ap-south-1"]
#   subnets           = var.subnets["ap-south-1"]
#   tags              = local.tags
#   providers         = {
#     aws = aws.ap-south-1
#   }
# }

# module "VPC_PEERING_us-east-1_eu-west-2" {
#   source = "../../Modules/VPC_PEERING"
#   peer_id = "${module.VPC-eu-west-2.vpc_id}"
#   vpc_id = "${module.VPC-us-east-1.vpc_id}"
#   peer_region = var.regions["eu-west-2"]
#   tags        = local.tags
#   providers = {
#     aws.this = aws
#     aws.peer = aws.eu-west-2
#   }
# }

# module "VPC_PEERING_ap-south-1_eu-west-2" {
#   source = "../../Modules/VPC_PEERING"
#   peer_id = "${module.VPC-eu-west-2.vpc_id}"
#   vpc_id = "${module.VPC-ap-south-1.vpc_id}"
#   peer_region = var.regions["eu-west-2"]
#   tags        = local.tags
#   providers = {
#     aws.this = aws.ap-south-1
#     aws.peer = aws.eu-west-2
#   }
# }

# module "VPC_PEERING_us-east-1_ap-south-1" {
#   source = "../../Modules/VPC_PEERING"
#   peer_id = "${module.VPC-ap-south-1.vpc_id}"
#   vpc_id = "${module.VPC-us-east-1.vpc_id}"
#   peer_region = var.regions["ap-south-1"]
#   tags        = local.tags
#   providers = {
#     aws.this = aws
#     aws.peer = aws.ap-south-1
#   }
# }

module "EKS-us-east-1" {
  source              = "../../Modules/EKS"
  vpc_id              = "${module.VPC-us-east-1.vpc_id}"
  role_arn_master     = "${module.iam_roles.role_arn_master}"
  subnet_ids          = "${module.VPC-us-east-1.subnet_public_ids}"
  security_groups     = var.security_groups["us-east-1"]
  node_group_count     = var.node_group_count["us-east-1"]
  role_arn_node_group = "${module.iam_roles.role_arn_node_group}"
  desired_size        = var.desired_size["us-east-1"]
  instance_types      = var.instance_types["us-east-1"]
  tags                = local.tags
  providers           = {
    aws = aws
  }
}

