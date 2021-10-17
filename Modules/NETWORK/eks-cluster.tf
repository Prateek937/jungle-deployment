#
# EKS Cluster Resources
#  * IAM Role to allow EKS service to manage other AWS services
#  * EC2 Security Group to allow networking traffic with EKS cluster
#  * EKS Cluster
#

resource "aws_iam_role" "jungle_cluster_role" {
  name = "jungle-cluster-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "jungle_cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.jungle_cluster_role.name
}

resource "aws_iam_role_policy_attachment" "jungle_cluster_AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.jungle_cluster_role.name
}

resource "aws_security_group" "jungle_cluster_sg" {
  name        = "jungle-cluster-sg"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.jungle_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jungle-eks"
  }
}

resource "aws_security_group_rule" "jungle_cluster_ingress" {
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.jungle_cluster_sg.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_eks_cluster" "jungle_eks_cluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.jungle_cluster_role.arn

  vpc_config {
    security_group_ids = [aws_security_group.jungle_cluster_sg.id]
    subnet_ids         = aws_subnet.jungle_subnet[*].id
  }

  depends_on = [
    aws_iam_role_policy_attachment.jungle_cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.jungle_cluster_AmazonEKSVPCResourceController,
  ]
}
