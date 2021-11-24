locals {
    Solution = "EX07"
    Stage = "Test"
}

locals {
  tags = {
    Name = "${local.Solution}-${local.Stage}"
    Solution = local.Solution
    Stage = local.Stage
  }
}

variable "regions" {
  default = {
    "us-east-1" = "us-east-1"
    "eu-west-2" = "eu-west-2"
    "ap-south-1"= "ap-south-1"
  }
}


variable "vpc_cidr"{
  default = {
    "us-east-1" = "10.0.0.0/16"
    "eu-west-2" = "172.0.0.0/16"
    "ap-south-1" = "173.0.0.0/16"
  }
}


variable "availability_zone" {
  default = {
    "us-east-1" = ["us-east-1a", "us-east-1b"],
    "eu-west-2" = ["eu-west-2a", "eu-west-2b"],
    "ap-south-1" = ["ap-south-1a", "ap-south-1b"]
  }
}

variable "subnets" {
  default = {
    "us-east-1" = {
      "public" = {
        "subnet-1" = {
          "availability_zone" = "us-east-1a",
          "cidr_block" = "10.0.1.0/24",
          "map_public_ip_on_launch" = true
        },

        "subnet-2" = {
          "availability_zone" = "us-east-1b",
          "cidr_block" = "10.0.2.0/24",
          "map_public_ip_on_launch" = true
        }
      }
      "private" = {
        "subnet-1" = {
          "availability_zone" = "us-east-1a",
          "cidr_block" = "10.0.3.0/24",
          "map_public_ip_on_launch" = true
        },

        "subnet-2" = {
          "availability_zone" = "us-east-1b",
          "cidr_block" = "10.0.4.0/24",
          "map_public_ip_on_launch" = true
        }
      }

    },

    "eu-west-2" = {
      "subnet-1" = {
        "availability_zone" = "eu-west-2a",
        "cidr_block" = "172.0.1.0/24",
        "map_public_ip_on_launch" = true
      },

      "subnet-2" = {
        "availability_zone" = "eu-west-2b",
        "cidr_block" = "172.0.2.0/24",
        "map_public_ip_on_launch" = true
      }
      
    },

    "ap-south-1" = {
      "subnet-1" = {
        "availability_zone" = "ap-south-1a",
        "cidr_block" = "173.0.1.0/24",
        "map_public_ip_on_launch" = true
      },

      "subnet-2" = {
        "availability_zone" = "ap-south-1b",
        "cidr_block" = "173.0.2.0/24",
        "map_public_ip_on_launch" = true

      }
    } 
  }
}

variable "security_groups" {
  default = {
    "us-east-1" = {
      "security-group-1" = {
        "rule-1" = {
          "cidr_blocks" = ["0.0.0.0/0"]
          "rule_description" = "for communication"
          "from_port" = 443
          "to_port" = 443
          "rule_type" = "ingress"
          "protocol" = "tcp"
        },
        "rule-2" = {
          "cidr_blocks" = ["0.0.0.0/0"]
          "rule_description" = "rule for egress from k8s"
          "from_port" = 0
          "to_port" = 0
          "rule_type" = "egress"
          "protocol" = "tcp"
        }
      }
    },

    "eu-west-2" = {
      "security-group-1" = {
        "rule-1" = {
          "cidr_blocks" = ["0.0.0.0/0"]
          "rule_description" = "for communication"
          "from_port" = 443
          "to_port" = 443
          "rule_type" = "ingress"
          "protocol" = "tcp"
        }
        "rule-2" = {
          "cidr_blocks" = ["0.0.0.0/0"]
          "rule_description" = "rule for egress from k8s"
          "from_port" = 0
          "to_port" = 0
          "rule_type" = "egress"
          "protocol" = "tcp"
        }
      }
    }
    "ap-south-1" = {
      "security-group-1" = {
        "rule-1" = {
          "cidr_blocks" = ["0.0.0.0/0"]
          "rule_description" = "for communication"
          "from_port" = 443
          "to_port" = 443
          "rule_type" = "ingress"
          "protocol" = "tcp"
        }
        "rule-2" = {
          "cidr_blocks" = ["0.0.0.0/0"]
          "rule_description" = "rule for egress from k8s"
          "from_port" = 0
          "to_port" = 0
          "rule_type" = "egress"
          "protocol" = "tcp"
        }
      }
    }
  }
}


variable "node_group_count" {
  default = {
    "us-east-1" = 1,
    "eu-west-2" = 1,
    "ap-south-1" = 1,
  }
}


variable "instance_types"{
  default = {
    "us-east-1" = ["t2.micro"],
    "eu-west-2" = ["t2.micro"],
    "ap-south-1" = ["t2.micro"]
  }
}

variable "desired_size" {
  default = {
    "us-east-1" = 2,
    "eu-west-2" = 2,
    "ap-south-1" = 2
  }
}
