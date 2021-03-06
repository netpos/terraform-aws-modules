/* subnet used by rds */
resource "aws_db_subnet_group" "rds_subnet_group" {
  count = var.create_replica ? 1 : 0
  name = "${var.identifier}-rds-replica-subnet-group"
  description = "RDS subnet group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "rds" {
  count = var.create_replica ? 1 : 0
  identifier = "${var.identifier}-db-replica"
  # Source database. For cross-region use db_instance_arn
  replicate_source_db = var.master_instance_arn

  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class

  allocated_storage = var.allocated_storage
  storage_encrypted = true
  kms_key_id = var.kms_key_id

  multi_az = var.multi_az
  vpc_security_group_ids = var.security_group_ids

  backup_window = "04:52-05:22"
  maintenance_window = "Sat:05:24-Sat:05:54"
  enabled_cloudwatch_logs_exports = var.cloudwatch_logs_exports

  backup_retention_period = 0
  skip_final_snapshot = true
  deletion_protection = true
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.*.id[0]

  timeouts {
    create = "240m"
  }
}