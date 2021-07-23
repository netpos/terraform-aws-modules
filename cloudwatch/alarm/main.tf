resource "aws_cloudwatch_metric_alarm" "alarm" {
  alarm_name = "${var.name}-alarm"
  alarm_description = var.description

  comparison_operator = var.comparison_operator
  evaluation_periods = var.evaluation_periods

  namespace = var.namespace
  dimensions = var.dimensions
  metric_name = var.metric_name

  period = var.period
  statistic = var.statistic
  threshold = var.threshold

  actions_enabled = var.actions_enabled
  alarm_actions = var.alarm_actions
  insufficient_data_actions = var.insufficient_data_actions
  ok_actions = var.ok_actions

  treat_missing_data = var.treat_missing_data

  tags = var.tags
}