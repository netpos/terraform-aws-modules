resource "aws_iam_role" "aws_iam_role" {
  name                = var.name
  assume_role_policy  = var.assume_role_policy
  managed_policy_arns = var.managed_policy_arns

  dynamic "inline_policy" {
    for_each = var.inline_policies
    content {
      name   = inline_policy.value.name
      policy = inline_policy.value.policy
    }
  }

  tags = var.tags
}

resource "aws_iam_instance_profile" "aws_iam_instance_profile" {
  count = var.create_instance_profile ? 1 : 0
  name  = "${var.name}-profile"
  role  = aws_iam_role.aws_iam_role.name

  tags = var.tags
}