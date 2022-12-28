output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnets_id" {
  value = aws_subnet.public_subnet.*.id
}

output "private_subnets_id" {
  value = aws_subnet.private_subnet.*.id
}

output "nat_gateway_id" {
  value = var.create_nat_gateway && var.nat_gateway_type == "NAT_GATEWAY" ? aws_nat_gateway.nat.*.id[0] : null
}