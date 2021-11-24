module "EKS" {
  source = "../../Modules/NETWORK"
  aws_region = var.aws_region
  cluster_name = var.cluster_name
  availability_zone = var.availability_zone
  node_group_name = var.node_group_name
  iam_role_name = var.iam_role_name
}

moduel "ec2" {
  source = "../../EC2"
  subnet_id = ${module.EKS.subnet_id}
}