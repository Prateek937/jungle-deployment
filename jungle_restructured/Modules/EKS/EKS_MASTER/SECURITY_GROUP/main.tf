module "security_group" {
  source = "./SECURITY_GROUP"
  security_group_name = "${var.tags.Name}-${var.index}"
  vpc_id              = var.vpc_id
  index               = var.index
  tags = {
    Name = "${var.tags.Name}-${var.index}"
    Solution = "${var.tags.Solution}"
    Stage = "${var.tags.Stage}"
  }
}

module "security_group_rule" {
  source = "./SECURITY_GROUP_RULE"
  security_group_id = "${module.security_group.security_group_id}"
  for_each = var.rules
  cidr_blocks = each.value["cidr_blocks"]
  rule_description = each.value["rule_description"]
  from_port   = each.value["from_port"]
  to_port     = each.value["to_port"]
  protocol    = each.value["protocol"]
  rule_type        = each.value["rule_type"]
}