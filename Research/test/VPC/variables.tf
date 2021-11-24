variable "vpc_cidr" {}
variable "vpc_name" {}
variable "default_tags" {
  type = map(string)
  default = {
  }
}