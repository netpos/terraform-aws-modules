resource "aws_ses_configuration_set" "ses_configuration_set" {
  name = "${var.environment}-${var.project_name}"
}