/* subnet used by rds */
resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "${var.identifier}-rds-subnet-group"

  description = "RDS subnet group"
  subnet_ids  = var.subnet_ids

  lifecycle {
    create_before_destroy = true
  }
}

/* Security Group for resources that want to access the Database */
module "db_access_sg" {
  source = "../networking/sg"

  vpc_id = var.vpc_id

  name           = "${var.identifier}-db-access"
  sg_description = "Allow access to RDS"
}

module "rds_sg" {
  source = "../networking/sg"

  name           = "${var.identifier}-rds"
  sg_description = "${var.identifier} Security Group"

  vpc_id     = var.vpc_id
  sg_ingress = [
    {
      from_port       = 3306
      to_port         = 3306
      description     = "MySQL sg access"
      protocol        = "tcp"
      self            = false
      cidr_blocks     = []
      security_groups = [
        module.db_access_sg.sg_id
      ]
    }
  ]
}

resource "aws_db_instance" "rds" {
  identifier = "${var.identifier}-db"

  allocated_storage    = var.allocated_storage
  instance_class       = var.instance_class
  multi_az             = var.multi_az
  username             = var.database_username
  password             = var.database_password
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.id

  vpc_security_group_ids = [
    module.rds_sg.sg_id
  ]

  skip_final_snapshot             = false
  final_snapshot_identifier       = "${var.identifier}-db-snapshot-final"
  storage_encrypted               = var.storage_encrypted
  publicly_accessible             = false
  snapshot_identifier             = var.snapshot_identifier
  backup_window                   = "04:52-05:22"
  maintenance_window              = "Sat:05:24-Sat:05:54"
  copy_tags_to_snapshot           = true
  deletion_protection             = true
  monitoring_interval             = var.monitoring_interval
  monitoring_role_arn             = var.monitoring_role_arn
  apply_immediately               = var.apply_immediately
  performance_insights_enabled    = var.performance_insights_enabled
  enabled_cloudwatch_logs_exports = var.cloudwatch_logs_exports

  engine               = var.engine
  engine_version       = var.engine_version
  parameter_group_name = var.create_parameter_group ? "${var.identifier}-db-pg" : null

  lifecycle {
    ignore_changes = [
      latest_restorable_time
    ]
  }

  depends_on = [
    aws_db_parameter_group.rds_parameter_group
  ]
}

resource "aws_db_parameter_group" "rds_parameter_group" {
  count = var.create_parameter_group ? 1 : 0

  name   = "${var.identifier}-db-pg"
  family = var.family_parameter_group

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name         = parameter.value["name"]
      value        = parameter.value["value"]
      apply_method = parameter.value["apply_method"]
    }
  }
}