resource "aws_internet_gateway" "jungle_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "jungle-eks-igw"
  }
}