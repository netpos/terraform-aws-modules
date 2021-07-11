output "requester" {
  value = var.has_peer ? aws_vpc_peering_connection_accepter.peering_connection_accepter.*.requester[0] : null
}

output "accepter" {
  value = var.has_peer ? aws_vpc_peering_connection_accepter.peering_connection_accepter.*.accepter[0] : null
}