resource "aws_ecs_task_definition" "ecs_task_definition" {
  count = var.create_task_definition ? 1 : 0

  family = "${var.environment}-${var.project_name}"
  container_definitions = jsonencode([
    {
      logConfiguration = {
        logDriver = local.log_driver
        options   = local.log_options
      },
      portMappings      = var.task_definition.port_mappings,
      cpu               = var.task_definition.cpu
      memory            = var.task_definition.has_hardlimit ? var.task_definition.memory_hard : null
      memoryReservation = var.task_definition.has_softlimit ? var.task_definition.memory : null
      environment       = var.task_definition.environment_variables,
      secrets           = var.task_definition.secret_variables,
      image             = var.task_definition.image
      name              = "${var.environment}-${var.project_name}"
      essential         = true
      ulimits           = var.task_definition.ulimits
      extraHosts        = var.task_definition.extra_hosts
    }
  ])
  memory                   = var.task_definition.memory
  task_role_arn            = var.task_definition.task_role_arn
  execution_role_arn       = var.task_definition.execution_role_arn
  requires_compatibilities = local.requires_compatibilities
  network_mode             = var.network_mode
  cpu                      = var.task_definition.cpu

  tags = var.tags
}

resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name              = var.log_group_name
  retention_in_days = var.retention_in_days

  tags = var.tags
}

locals {
  requires_compatibilities = concat(["EC2"], var.network_mode == "awsvpc" ? ["FARGATE"] : [])

  aws_log_options = {
    awslogs-group : "/ecs/${var.environment}/${var.project_name}",
    awslogs-region : var.task_definition.aws_log_region,
    awslogs-stream-prefix : "ecs"
  }
  log_driver  = var.logs == null ? "awslogs" : var.logs.driver
  log_options = var.logs == null ? local.aws_log_options : var.logs.options
}