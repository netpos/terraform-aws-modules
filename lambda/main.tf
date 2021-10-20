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

  dynamic "vpc_config" {
    for_each = var.vpc_subnet_ids != null && var.vpc_security_group_ids != null ? [true] : []
    content {
      security_group_ids = var.vpc_security_group_ids
      subnet_ids         = var.vpc_subnet_ids
    }
  }

}