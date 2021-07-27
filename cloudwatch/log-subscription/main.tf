resource "aws_cloudwatch_log_subscription_filter" "log_subscription_filter" {
  name            = "${var.name}_log"
  destination_arn = var.destination_arn
  filter_pattern  = var.filter_pattern
  log_group_name  = var.log_group_name

  role_arn        = var.iam_for_lambda_arn
  distribution    = var.distribution
}