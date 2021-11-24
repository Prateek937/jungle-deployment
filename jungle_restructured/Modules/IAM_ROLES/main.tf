module "iam_role_master" {
  source = "./IAM_ROLE_MASTER"
  iam_role_master_name = "${var.tags.Name}-master"
  tags = {
    Name = "${var.tags.Name}-master"
    Solution = "${var.tags.Solution}"
    Stage = "${var.tags.Stage}" 
  }
}

module "iam_role_node_groups" {
  source = "./IAM_ROLE_NODE_GROUP"
  iam_role_node_group_name = "${var.tags.Name}-Node-Groups"
  tags = {
    Name = "${var.tags.Name}-Node-Groups"
    Solution = "${var.tags.Solution}"
    Stage = "${var.tags.Stage}" 
  }
}