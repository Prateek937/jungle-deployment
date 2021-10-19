provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  alias = "useast1"
  region = "us-east-1"
}
