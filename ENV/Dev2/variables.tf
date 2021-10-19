variable "aws_region" {
}

variable "cluster-name" {
  default = "jungle-eks-cluster"
  type = string
}

variable "availability_zone" {
  default = ["ap-south-1a", "ap-south-1b"]
  type = list
}
