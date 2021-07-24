resource "aws_cloudwatch_metric_alarm" "alarm" {
  alarm_name = "${var.name}-alarm"
  alarm_description = var.description

  comparison_operator = var.comparison_operator
  evaluation_periods = var.evaluation_periods

  dynamic "metric_query" {
    for_each = var.metric_query
    content {
      id = metric_query.key
      expression = metric_query.value.expression
      label = metric_query.value.label
      dynamic metric {
        for_each = metric_query.value.metric
        content {
          namespace = metric.value.namespace
          dimensions = metric.value.dimensions
          unit = metric.value.unit
          metric_name = metric.value.metric_name
          period = metric.value.period
          stat = metric.value.stat
        }
      }
      return_data = metric_query.value.return_data
    }
  }

  threshold = var.threshold

  actions_enabled = var.actions_enabled
  alarm_actions = var.alarm_actions
  insufficient_data_actions = var.insufficient_data_actions
  ok_actions = var.ok_actions

  treat_missing_data = var.treat_missing_data

  tags = var.tags
}