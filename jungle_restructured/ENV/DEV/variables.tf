####################
# GLOBAL VARIABLES #
####################

variable "iam_role_master_name" {
  default = "jungle-eks-cluster-role"
}

variable "iam_role_node_group_name" {
  default = "jungle-eks-node-group-role"
}
#########################################################

variable "regions" {
  default = {
    "us-east-1" = "us-east-1"
    "eu-west-2" = "eu-west-2"
  }
}

variable "eks_cluster_name" {
  default = {
    "us-east-1" = "jungle-eks-cluster-us-east-1",
    "eu-west-2" = "jungle-eks-cluster-eu-west-2"
  }
}


variable "vpc_cidr"{
  default = {
    "us-east-1" = "10.0.0.0/16"
    "eu-west-2" = "172.0.0.0/16"
  }
}


variable "availability_zone" {
  default = {
    "us-east-1" = ["us-east-1a", "us-east-1b"],
    "eu-west-2" = ["eu-west-2a", "eu-west-2b"]
  }
}

variable "subnets" {
  default = {
    "us-east-1" = {
      "subnet-1" = {
        "availability_zone" = "us-east-1a",
        "cidr_block" = "10.0.1.0/24",
        "map_public_ip_on_launch" = true

      }
      "subnet-2" = {
        "availability_zone" = "us-east-1b",
        "cidr_block" = "10.0.2.0/24",
        "map_public_ip_on_launch" = true

      }
    },
    "eu-west-2" = {
      "subnet-1" = {
        "availability_zone" = "eu-west-2a",
        "cidr_block" = "172.0.1.0/24",
        "map_public_ip_on_launch" = true

      }
      "subnet-2" = {
        "availability_zone" = "eu-west-2b",
        "cidr_block" = "172.0.2.0/24",
        "map_public_ip_on_launch" = true

      }
    } 
  }
}

# wrap the security group variables to make it less
variable "security_groups" {
  default = {
    "us-east-1" = {
      "eks-cluster-sg" = {
        "rule-1" = {
          "cidr_blocks" = ["0.0.0.0/0"]
          "rule_description" = "us-east-1-rule"
          "from_port" = 443
          "to_port" = 443
          "rule_type" = "ingress"
          "protocol" = "tcp"
        }
        "rule-2" = {
          "cidr_blocks" = ["0.0.0.0/0"]
          "rule_description" = "us-east-1-rule"
          "from_port" = 0
          "to_port" = 0
          "rule_type" = "egress"
          "protocol" = "tcp"
        }
      }
    },

    "eu-west-2" = {
      "eks-cluster-sg" = {
        "rule-1" = {
          "cidr_blocks" = ["0.0.0.0/0"]
          "rule_description" = "us-east-1-rule"
          "from_port" = 443
          "to_port" = 443
          "rule_type" = "ingress"
          "protocol" = "tcp"
        }
        "rule-2" = {
          "cidr_blocks" = ["0.0.0.0/0"]
          "rule_description" = "us-east-1-rule"
          "from_port" = 0
          "to_port" = 0
          "rule_type" = "egress"
          "protocol" = "tcp"
        }
      }
    }
  }
}


variable "node_group_name" {
  default = {
    "us-east-1" = ["jungle-eks-node-1-us-east-1"],
    "eu-west-2" = ["jungle-eks-node-1-eu-west-2"]
  }
}

variable "instance_types"{
  default = {
    "us-east-1" = ["t2.micro"],
    "eu-west-2" = ["t2.micro"]
  }
}

variable "desired_size" {
  default = {
    "us-east-1" = 2,
    "eu-west-2" = 2
  }
}