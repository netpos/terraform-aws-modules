resource "aws_iam_user" "iam-user" {
  name = var.name
  path = var.path

  tags = var.tags
}

resource "aws_iam_user_group_membership" "iam-user-group" {
  count = length(var.groups) == 0 ? 0 : 1

  user   = aws_iam_user.iam-user.name
  groups = var.groups
}