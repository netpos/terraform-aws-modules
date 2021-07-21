output "sns_arn" {
  value = concat(aws_sns_topic.sns.*.arn, [
    null])[0]
}