resource "aws_eks_cluster" "jungle_eks_cluster" {
  name     = var.eks_cluster_name
  role_arn = var.role_arn_master

  vpc_config {
    security_group_ids = var.security_group_ids
    subnet_ids         = var.subnet_ids
  }

  tags = var.tags

}