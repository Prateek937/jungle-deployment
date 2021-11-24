variable "availability_zone" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "cluster_name" {
  default = "jungle-eks-cluster"
}

#vpc
variable "assign_public_ip" {
  default = true
}

#eks
variable "iam_role_master_name" {
  default = "jungle-eks-cluster-role"
}

#eks
variable "desired_size" {
  default = 1
}

#eks
variable "number_of_rules" {
    default = 3
}

variable "cidr_blocks" {
    type = list
    default = [["0.0.0.0/0"], ["0.0.0.0/0"], ["0.0.0.0/0"]]

}

variable "rule_description" {
    type = string
    default = "rule for testing"

}

variable "from_port" {
  default = [443, 0, 0]
}

variable "to_port" {
  default = [443, 0, 0]
}

variable "rule_type" {
  default = ["ingress", "egress", "ingress"]
}

variable "protocol" {
  type = string
  default = "tcp"
}

variable "node_group_name" {
  type = list
  default = ["jungle-eks-node"]
}

variable "iam_role_node_group_name" {
  default = "jungle-eks-node-group-role"
}