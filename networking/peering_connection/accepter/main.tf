resource "aws_vpc_peering_connection_accepter" "peering_connection_accepter" {
  count = var.has_peer ? 1 : 0

  vpc_peering_connection_id = var.peer_id
  auto_accept = var.auto_accept
  tags = var.tags
}
//
//resource "aws_route" "route" {
//  count = var.has_peer ? length(var.route_table_id) : 0
//
//  route_table_id = var.route_table_id[count.index]
//  destination_cidr_block = aws_vpc_peering_connection_accepter.peering_connection_accepter[0].requester[0].cidr_block
//  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peering_connection_accepter[0].id
//}
