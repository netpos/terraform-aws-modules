resource "aws_lambda_function" "aws_lambda_function" {
  function_name = "${var.environment}-${var.project_name}"
  description = var.description
  role = ""
  handler = var.handler
  memory_size = var.memory_size
  runtime = var.runtime
  timeout = var.timeout
  architectures = var.architectures

  dynamic "environment" {
    for_each = length(keys(var.environment_variables)) == 0 ? [] : [
      true]
    content {
      variables = var.environment_variables
    }
  }
}