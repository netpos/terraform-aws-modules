resource "aws_db_instance" "rds" {
  count               = var.create_replica ? 1 : 0
  identifier          = "${var.identifier}-db-replica"
  # Source database. For cross-region use db_instance_arn
  replicate_source_db = var.master_instance_arn

  instance_class = var.instance_class

  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_encrypted     = true

  multi_az               = var.multi_az
  vpc_security_group_ids = var.security_group_ids

  backup_window                   = "04:52-05:22"
  maintenance_window              = "Sat:05:24-Sat:05:54"
  enabled_cloudwatch_logs_exports = var.cloudwatch_logs_exports

  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = true

  timeouts {
    create = "240m"
  }
}