
module "ec2" {
  source = "../test"
  providers = {
    aws = aws.nothing
   }
}


module "ec2_nothing" {
  
  source = "../test"
  providers = {
    aws = aws.useast1
   }
}


