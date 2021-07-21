resource "aws_sns_topic_subscription" "sns_topic_subscription" {
  count = var.enable_subscription ? 1 : 0

  topic_arn = var.sns_topic_arn
  protocol = var.protocol
  endpoint = var.endpoint
  filter_policy = var.filter_policy

}