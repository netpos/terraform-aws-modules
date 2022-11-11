resource "aws_ecr_repository" "ecr_repository" {
  name = var.name

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags
}

resource "aws_ecr_lifecycle_policy" "ecr_repository_lifecycle_policy" {
  count = var.lifecycle_policy == null ? 0 : 1

  repository = aws_ecr_repository.ecr_repository.name
  policy     = var.lifecycle_policy
}