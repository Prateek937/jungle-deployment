# provider "aws" {
#   region = "ap-south-1"
# }

# provider "aws" {
#   region = "us-east-1"
#   alias = "useast"
  
# }

resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = "t2.micro"
  security_group_id = var.sgid

  tags = {
    Name = var.name
  }

  lifecycle = {
    prevent_destroy = true
  }
  
}


resource "aws_instance" "ec1" {
  ami           = var.ami
  instance_type = "t2.micro"
  security_group_id = var.sgid

  tags = {
    Name = var.name
  }

}
