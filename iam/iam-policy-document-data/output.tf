output "policy_json" {
  description = "The assume role policy json"
  value       = data.aws_iam_policy_document.assume_role.json
}
