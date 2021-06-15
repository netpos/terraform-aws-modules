resource "aws_appautoscaling_policy" "ecs_autoscaling_policy" {
  count = var.auto_scalling_enable ? 1 : 0

  name = "${var.name}-policy"
  policy_type = "StepScaling"
  resource_id = var.target.resource_id
  scalable_dimension = var.target.scalable_dimension
  service_namespace = var.target.service_namespace

  step_scaling_policy_configuration {
    adjustment_type = "ChangeInCapacity"
    cooldown = var.cooldown
    metric_aggregation_type = var.metric_aggregation

    step_adjustment {
      scaling_adjustment = var.scaling_adjustment
    }
  }
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
    aws_appautoscaling_policy.ecs_autoscaling_policy[count.index].arn]

  tags = var.tags
}