locals {
  sns_destination_topic = var.create_sns ? module.sns_destination_topic.*.sns_arn[0] : var.sns_arn
}

resource "aws_ses_configuration_set" "ses_configuration_set" {
  name = "${var.name}-configuration-set"
}

module "sns_destination_topic" {
  source = "./../../sns/topic"
  count = var.create_sns ? 1 : 0
  enable_sns = true
  sns_topic_name = "${var.name}_topic"
  display_name = "${var.name} SNS topic for configuration set"
  tags = var.tags
}

module "sns_destination_subscription" {
  source = "./../../sns/subscription"
  count = var.create_sns ? 1 : 0
  enable_subscription = true
  endpoint = var.sns_endpoint
  protocol = var.sns_protocol
  sns_topic_arn = module.sns_destination_topic.*.sns_arn[0]
}

resource "aws_ses_event_destination" "sns_destination" {
  name = "${var.name}-destination"
  configuration_set_name = aws_ses_configuration_set.ses_configuration_set.name
  enabled = var.enabled_destination
  matching_types = var.matching_types

  sns_destination {
    topic_arn = local.sns_destination_topic
  }
  tags = var.tags
}
