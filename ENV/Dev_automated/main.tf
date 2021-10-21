module "network" {
  source = "../../Modules/NETWORK"
  aws_region = var.aws_region
  cluster_name = var.cluster_name
  availability_zone = var.availability_zone
}