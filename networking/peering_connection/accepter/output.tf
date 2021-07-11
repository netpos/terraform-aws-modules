output "requester" {
  value = var.has_peer ? aws_vpc_peering_connection_accepter.peering_connection_accepter.*.requester[0] : null
}