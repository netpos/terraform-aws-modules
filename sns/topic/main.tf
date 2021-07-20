resource "aws_sns_topic" "sns" {
  count = var.enable_sns ? 1 : 0

  name = var.sns_topic_name
  display_name = var.display_name
  kms_master_key_id = var.sns_topic_kms_key_id
  tags = var.tags
}