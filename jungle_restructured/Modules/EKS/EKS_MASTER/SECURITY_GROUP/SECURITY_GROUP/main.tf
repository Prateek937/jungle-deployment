resource "aws_security_group" "jungle_cluster_sg" {
  name        = var.security_group_name
  description = "Cluster communication with worker nodes"
  vpc_id      = var.vpc_id

  # egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  tags = var.tags
}
