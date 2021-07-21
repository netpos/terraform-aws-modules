resource "aws_vpc_peering_connection_accepter" "peering_connection_accepter" {
  vpc_peering_connection_id = var.peer_id
  auto_accept = var.auto_accept
  tags = var.tags
}

data "aws_vpc_peering_connection" "peer_data" {
  id = var.peer_id
}

data "aws_route_tables" "vpc_route_tables" {
  vpc_id = data.aws_vpc_peering_connection.peer_data.peer_vpc_id
}

resource "aws_route" "route" {
  count = length(data.aws_route_tables.vpc_route_tables.ids)

  route_table_id = tolist(data.aws_route_tables.vpc_route_tables.ids)[count.index]
  destination_cidr_block = data.aws_vpc_peering_connection.peer_data.cidr_block
  vpc_peering_connection_id = var.peer_id
}
