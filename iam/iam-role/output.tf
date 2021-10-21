output "iam_role_arn" {
  description = "ARN of IAM role"
  value = element(concat(aws_iam_role.aws_iam_role.*.arn, [
    ""]), 0)
}

output "iam_role_name" {
  description = "Name of IAM role"
  value = element(concat(aws_iam_role.aws_iam_role.*.name, [
    ""]), 0)
}

output "iam_role_path" {
  description = "Path of IAM role"
  value = element(concat(aws_iam_role.aws_iam_role.*.path, [
    ""]), 0)
}

output "iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value = element(concat(aws_iam_role.aws_iam_role.*.unique_id, [
    ""]), 0)
}

output "role_sts_externalid" {
  description = "STS ExternalId condition value to use with a role"
  value = var.role_sts_externalid
}