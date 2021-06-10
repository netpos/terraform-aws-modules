/* subnet used by rds */
resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "${var.environment}-rds-subnet-group"
  description = "RDS subnet group"
  subnet_ids = var.subnet_ids
  tags = {
    Environment = var.environment
  }
}

/* Security Group for resources that want to access the Database */
module "db_access_sg" {
  source = "../networking/sg"
  vpc_id = var.vpc_id
  name = "${var.environment}-db-access"
  sg_description = "Allow access to RDS"
}

module "rds_sg" {
  source = "../networking/sg"
  name = "${var.environment}-rds"
  sg_description = "${var.environment} Security Group"
  vpc_id = var.vpc_id
  sg_ingress = [
    {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      self = false
      security_groups = []
      description = "Mysql legacy access"
      cidr_blocks = [
        var.legacy_vpc_cidr_block]
    },
    {
      from_port = 3306
      to_port = 3306
      description = "MySQL sg access"
      protocol = "tcp"
      self = false
      cidr_blocks = []
      security_groups = [
        module.db_access_sg.sg_id]
    }
  ]
}


resource "aws_db_instance" "rds" {
  identifier = "${var.environment}-smartpos-db"
  allocated_storage = var.allocated_storage
  engine = "mysql"
  instance_class = var.instance_class
  multi_az = var.multi_az
  username = var.database_username
  password = var.database_password
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.id
  vpc_security_group_ids = [
    module.rds_sg.sg_id]
  skip_final_snapshot = false
  final_snapshot_identifier = "${var.environment}-smartpos-db-snapshot-final"
  storage_encrypted = var.storage_encrypted
  publicly_accessible = false
  snapshot_identifier = var.snapshot_identifier
  backup_window = "04:52-05:22"
  maintenance_window = "Sat:05:24-Sat:05:54"
  copy_tags_to_snapshot = true
  deletion_protection = true
  monitoring_interval = var.monitoring_interval
  monitoring_role_arn = var.monitoring_role_arn
  apply_immediately = true
  performance_insights_enabled = var.performance_insights_enabled
  enabled_cloudwatch_logs_exports = [
    "error",
    "general",
    "slowquery"]
  engine_version = "8.0"
  tags = {
    Environment = var.environment
  }
}