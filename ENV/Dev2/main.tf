module "network" {
  source = "../../Modules/NETWORK"
  cluster_name = var.cluster_name
  availability_zone = var.availability_zone
  providers = {
    aws = aws
   }
}

module "network_useast1" {
  source = "../../Modules/NETWORK"
  cluster_name = var.cluster_name
  availability_zone = var.availability_zone
  providers = {
    aws = aws.useast1
   }
}


