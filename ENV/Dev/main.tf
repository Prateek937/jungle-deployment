module "network" {
  count = length(var.aws_region)
  source = "../../Modules/NETWORK"
  
  # We can not pass aws_region as a meta argument here.
  aws_region = var.aws_region[count.index]  


  cluster-name = var.cluster-name
  availability_zone = var.availability_zone

}

