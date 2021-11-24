resource "tls_private_key" "key_pair" {
  algorithm   = "RSA"
}

resource "aws_key_pair" "key" {
  key_name   = "prac"
  public_key = tls_private_key.key_pair.public_key_openssh
}


resource "local_file" "private_key" {
  content         = tls_private_key.key_pair.private_key_pem
  filename        = "prac.pem"
  file_permission = "400"
}