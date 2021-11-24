resource "aws_vpc_peering_connection" "jungle_vpc_peering" {
  provider = aws.this
  peer_vpc_id   = var.peer_id
  vpc_id        = var.vpc_id
  auto_accept   = false
  peer_region   = var.peer_region
  tags = var.tags
}

resource "aws_vpc_peering_connection_accepter" "peer" {
    provider = aws.peer
    vpc_peering_connection_id  = aws_vpc_peering_connection.jungle_vpc_peering.id
    auto_accept = true
    tags = var.tags
}