resource "aws_vpc_peering_connection_accepter" "peering_connection_accepter" {
  count = var.has_peer ? 1 : 0

  vpc_peering_connection_id = var.peer_id
  auto_accept = var.auto_accept
  tags = var.tags
}