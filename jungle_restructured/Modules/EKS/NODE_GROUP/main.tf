resource "aws_eks_node_group" "jungle_ng" {
  count = var.node_group_count
  cluster_name    = var.eks_cluster_name
  node_group_name = "${var.tags.Name}-${count.index}"
  node_role_arn   = var.role_arn_node_group
  subnet_ids      = var.subnet_ids
  instance_types = var.instance_types 
  tags = tomap({
    "Name" = "${var.tags.Name}",
    "Solution" = "${var.tags.Solution}"
    "Stage" = "${var.tags.Solution}"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared",
  })
  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

#   depends_on = [
#     aws_iam_role_policy_attachment.jungle_node_AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.jungle_node_AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.jungle_node_AmazonEC2ContainerRegistryReadOnly,
#   ]
}
