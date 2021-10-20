resource "aws_lambda_function" "aws_lambda_function" {
  function_name = "${var.environment}-${var.project_name}"
  description = var.description
  role = ""
  handler = var.package_type != "Zip" ? null : var.handler
  memory_size = var.memory_size
  runtime = var.package_type != "Zip" ? null : var.runtime
  timeout = var.timeout
  package_type = var.package_type
  architectures = var.architectures

  dynamic "environment" {
    for_each = length(keys(var.environment_variables)) == 0 ? [] : [
      true]
    content {
      variables = var.environment_variables
    }
  }
}