variable "regions" {
  type = map
  default = {
    "Webserver1" = "us-east-1"
    "Webserver2" = "us-west-2"
    "Webserver3" = "ap-south-1"
  }
}

variable "image_names" {
  type = map
  default = {
    "Webserver1" = "Node-app-image-1"
    "Webserver2" = "Node-app-image-2"
    "Webserver3" = "Node-app-image-3"
  }
}



variable "cluster-name" {
  default = "jungle-eks-cluster"
  type = string
}

variable "availability_zone" {
  default = ["ap-south-1a", "ap-south-1b"]
  type = list
}

#################################################



###################################################