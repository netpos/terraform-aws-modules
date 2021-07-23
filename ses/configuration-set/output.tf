output "configuration_set_name" {
  value = aws_ses_configuration_set.ses_configuration_set.name
}

output "configuration_sns_topic_arn" {
  value = var.create_sns ? module.sns_destination_topic.*.sns_arn[0] : null
}
