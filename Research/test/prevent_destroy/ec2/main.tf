resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "foo" {
  count = 1
  ami           = "ami-041d6256ed0f2061c" # ap-south-1
  instance_type = "t2.micro"
  subnet_id = aws_subnet.my_subnet.id
  tags = {
    "Name" = "foo"
  }

}


output "subnet_id" {
  value = aws_subnet.my_subnet.id
}

