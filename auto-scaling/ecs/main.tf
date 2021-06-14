resource "aws_appautoscaling_target" "appautoscaling_target" {
  count = var.auto_scalling_enable ? 1 : 0
  max_capacity = var.max_capacity
  min_capacity = var.min_capacity
  resource_id = "service/${var.cluster_name}/${var.service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs"

  tags = var.tags
}

resource "aws_appautoscaling_policy" "ecs_autoscaling_policy" {
  count = var.auto_scalling_enable ? 1 : 0

  name = "${var.name}-policy"
  policy_type = "StepScaling"
  resource_id = aws_appautoscaling_target.appautoscaling_target.resource_id
  scalable_dimension = aws_appautoscaling_target.appautoscaling_target.scalable_dimension
  service_namespace = aws_appautoscaling_target.appautoscaling_target.service_namespace

  step_scaling_policy_configuration {
    adjustment_type = "ChangeInCapacity"
    cooldown = var.cooldown
    metric_aggregation_type = var.metric_aggregation

    step_adjustment {
      scaling_adjustment = var.scaling_adjustment
    }
  }

  tags = var.tags
}

resource "aws_cloudwatch_metric_alarm" "cloudwatch_autoscaling_alarm" {
  count = var.auto_scalling_enable ? 1 : 0

  alarm_name = "${var.name}-alarm"
  comparison_operator = var.comparison_operator
  evaluation_periods = var.evaluation_periods
  metric_name = var.metric_name
  namespace = "AWS/ECS"
  period = var.period
  statistic = var.statistic
  threshold = var.threshold

  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.service_name
  }

  alarm_actions = [
    aws_appautoscaling_policy.ecs_autoscaling_policy.arn]

  tags = var.tags
}