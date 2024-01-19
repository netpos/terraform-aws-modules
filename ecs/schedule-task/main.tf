resource "aws_cloudwatch_event_rule" "event_rule" {
  count = var.schedule_task_enabled ? 1 : 0

  name                = "${var.schedule_task_name}-rule"
  schedule_expression = var.event_rule_schedule_expression
  description         = var.event_rule_description
  tags                = var.tags
}

resource "aws_cloudwatch_event_target" "ecs_scheduled_task_target" {
  count = var.schedule_task_enabled ? 1 : 0

  rule      = aws_cloudwatch_event_rule.event_rule[count.index].name
  target_id = "${var.schedule_task_name}-target"
  arn       = var.ecs_cluster_arn
  role_arn  = var.iam_cw_event_role_arn

  ecs_target {
    group               = "${var.schedule_task_name}-group"
    launch_type         = var.launch_type
    platform_version    = var.launch_type == "FARGATE" ? "LATEST" : null
    task_count          = var.ecs_task_count
    task_definition_arn = var.ecs_task_definition_arn

    dynamic "network_configuration" {
      for_each = var.network_configuration == null ? [] : [var.network_configuration]
      content {
        subnets          = network_configuration.value["subnets"]
        security_groups  = network_configuration.value["security_groups"]
        assign_public_ip = network_configuration.value["assign_public_ip"]
      }
    }

    tags = var.tags
  }
}