resource "aws_ecs_service" "ecs_service" {
  count = var.ecs_service_enabled ? 1 : 0

  name                 = "${var.environment}-${var.project_name}"
  cluster              = var.cluster_id
  task_definition      = var.task_definition_arn
  desired_count        = var.min_capacity
  force_new_deployment = true
  launch_type          = var.launch_type

  dynamic "capacity_provider_strategy" {
    for_each = var.capacity_provider_strategy
    content {
      capacity_provider = capacity_provider_strategy.value["capacity_provider"]
      weight            = capacity_provider_strategy.value["weight"]
      base              = capacity_provider_strategy.value["base"]
    }
  }

  deployment_maximum_percent        = var.deployment_maximum_percent
  health_check_grace_period_seconds = var.health_check_grace_period_seconds
  enable_execute_command            = var.enable_execute_command

  dynamic "network_configuration" {
    for_each = var.launch_type == "FARGATE" || var.launch_type == null ? [
      true
    ] : []
    content {
      subnets          = var.subnet_ids
      assign_public_ip = var.assign_public_ip
      security_groups  = var.service_sg
    }
  }

  dynamic "load_balancer" {
    for_each = local.lb_list
    content {
      target_group_arn = load_balancer.value["target_group_arn"]
      container_name   = load_balancer.value["container_name"]
      container_port   = load_balancer.value["container_port"]
    }
  }

  propagate_tags = "TASK_DEFINITION"
  tags = var.tags

  lifecycle {
    ignore_changes = [
      desired_count
    ]
  }
}

locals {
  lb_list = var.lb == null ? var.lb_list : [
    var.lb
  ]
}