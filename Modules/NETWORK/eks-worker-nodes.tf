#
# EKS Worker Nodes Resources
#  * IAM role allowing Kubernetes actions to access other AWS services
#  * EKS Node Group to launch worker nodes
#

resource "aws_iam_role" "jungle_node" {
  name = var.node_group_name

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "jungle_node_AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.jungle_node.name
}

resource "aws_iam_role_policy_attachment" "jungle_node_AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.jungle_node.name
}

resource "aws_iam_role_policy_attachment" "jungle_node_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.jungle_node.name
}

resource "aws_eks_node_group" "jungle_ng" {
  cluster_name    = aws_eks_cluster.jungle_eks_cluster.name
  node_group_name = "jungle-ng-1"
  node_role_arn   = aws_iam_role.jungle_node.arn
  subnet_ids      = aws_subnet.jungle_subnet[*].id

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.jungle_node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.jungle_node_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.jungle_node_AmazonEC2ContainerRegistryReadOnly,
  ]
}
