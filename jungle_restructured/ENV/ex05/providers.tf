provider "aws" {
  region= var.regions["us-east-1"]
}

provider "aws" {
  region = var.regions["eu-west-2"]
  alias = "eu-west-2"
}

provider "aws" {
  region = var.regions["ap-south-1"]
  alias = "ap-south-1"
}