output "primary_endpoint_address" {
  value = aws_elasticache_replication_group.redis_group.primary_endpoint_address
}

output "reader_endpoint_address" {
  value = aws_elasticache_replication_group.redis_group.reader_endpoint_address
}

output "sg_access_id" {
  value = var.create_security_groups ? module.elasticache_access_sg.*.sg_id[0] : null
}