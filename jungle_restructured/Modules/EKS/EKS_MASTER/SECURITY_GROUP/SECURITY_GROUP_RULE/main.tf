resource "aws_security_group_rule" "jungle_cluster_ingress" {
  cidr_blocks       = var.cidr_blocks
  description       = var.rule_description
  from_port         = var.from_port
  protocol          = var.protocol
  security_group_id = var.security_group_id
  to_port           = var.to_port
  type              = var.rule_type
}
