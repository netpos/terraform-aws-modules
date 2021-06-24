resource "aws_elasticache_replication_group" "redis_group" {
  replication_group_id = var.replication_group_id
  replication_group_description = var.replication_group_description

  apply_immediately = var.apply_immediately
  maintenance_window = var.maintenance_window
  notification_topic_arn = var.notification_topic_arn

  node_type = var.node_type
  port = var.port
  number_cache_clusters = var.cluster_count
  parameter_group_name = var.parameter_group_name == null ? "default.redis${var.engine_version}" : var.parameter_group_name
  availability_zones = var.availability_zones
  security_group_ids = var.security_group_ids
  subnet_group_name = length(var.subnet_ids) > 0 ? aws_elasticache_subnet_group.redis_subnet_group.*.name[0] : null

  automatic_failover_enabled = var.cluster_count > 1 ? var.automatic_failover_enabled : false
  multi_az_enabled = var.multi_az_enabled

  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  kms_key_id = var.at_rest_encryption_enabled ? var.kms_key_id : null

  transit_encryption_enabled = var.transit_encryption_enabled
  auth_token = var.transit_encryption_enabled ? var.auth_token : null

  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  engine_version = var.engine_version

  snapshot_name = "${var.replication_group_id}-snapshot"
  snapshot_retention_limit = var.snapshot_retention_limit
  snapshot_window = var.snapshot_window
  final_snapshot_identifier = "${var.replication_group_id}-snapshot-final"

  tags = var.tags
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  count = length(var.subnet_ids) > 0 ? 1 : 0

  name = "${var.replication_group_id}-subnet-group"
  description = var.replication_group_description
  subnet_ids = var.subnet_ids
  tags = var.tags

}