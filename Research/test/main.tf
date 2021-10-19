# provider "aws" {
#   region = "ap-south-1"
# }

# provider "aws" {
#   region = "us-east-1"
#   alias = "useast"
  
# }

variable "az" {
  default = ["ap-south-1a"]
}

resource "aws_instance" "ec2" {
  ami           = "ami-041d6256ed0f2061c"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
  
}

