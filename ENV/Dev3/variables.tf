# variable "name" {
#   default = "test"
# }

variable "webservers" {
  type = map
  default = {
    "john" = {
                "region" = "us-east-1", 
                "image" = "Node-app-image"
                "siblings" = ["jane"]
              }
    "jane" = {
                "region" = "eu-west-2", 
                "image" = "Node-app-image"
                "sibings" = ["john"]
              }

              
  }


}

# variable "image_names" {
#   type = map
#   default = {
#     "Webserver1" = "Node-app-image-1"
#     "Webserver2" = "Node-app-image-2"
#     "Webserver3" = "Node-app-image-3"
#   }
# }




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