resource "aws_iam_group" "iam-group" {
  name = var.name
  path = var.path
}

resource "aws_iam_group_policy_attachment" "iam-group-policy-attachment" {
  for_each = var.policies_arn

  group = aws_iam_group.iam-group.name

  policy_arn = each.key
}