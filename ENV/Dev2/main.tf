module "network" {
  source = "../../Modules/NETWORK"
  cluster-name = var.cluster-name
  availability_zone = var.availability_zone
  providers = {
    aws = aws
   }
}

module "network_useast1" {
  source = "../../Modules/NETWORK"
  cluster-name = var.cluster-name
  availability_zone = var.availability_zone
  providers = {
    aws = aws.useast1
   }
}


