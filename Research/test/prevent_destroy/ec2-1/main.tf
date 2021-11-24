resource "aws_vpc" "my_vpc_1" {
  cidr_block = "10.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet_1" {
  vpc_id            = aws_vpc.my_vpc_1.id
  cidr_block        = "10.16.10.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_network_interface" "foo1" {
  subnet_id   = aws_subnet.my_subnet_1.id
  private_ips = ["10.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "foo1" {
  count = 1
  ami           = "ami-041d6256ed0f2061c" # ap-south-1
  instance_type = "t2.micro"
  security_groups= var.sg_id
  tags = {
    "Name" = "foo1"
    "sg" = var.s
  }

}

variable "sg_id" {
  
}
variable "s" {
  
}