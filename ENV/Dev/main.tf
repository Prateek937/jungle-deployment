module "network" {
  # count = length(var.aws_region)
  source = "../../Modules/NETWORK"
  # aws_region = var.aws_region[count.index]
  cluster-name = var.cluster-name
  availability_zone = var.availability_zone

}

