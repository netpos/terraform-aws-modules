resource "aws_secretsmanager_secret" "secret" {
  name        = var.name
  description = var.description
  policy      = var.policy

  tags = var.tags
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = var.secret_string
}