provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "../../Modules/NETWORK"
  aws_region = var.aws_region
  cluster-name = var.cluster-name
  availability_zone = var.availability_zone

}

