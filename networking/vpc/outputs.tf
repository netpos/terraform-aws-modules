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
  value = aws_nat_gateway.nat.*.id[0]
}