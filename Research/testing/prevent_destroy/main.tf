module "Network" {
  source = "../../test/prevent_destroy/ec2"
}

module "ec2" {
  source = "../../test/prevent_destroy/ec2"
}