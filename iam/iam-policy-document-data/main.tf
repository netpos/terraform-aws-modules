locals {
  role_sts_externalid = flatten([
    var.role_sts_externalid])
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    actions = var.trusted_role_actions

    principals {
      type = "AWS"
      identifiers = var.trusted_role_arns
    }

    principals {
      type = "Service"
      identifiers = var.trusted_role_services
    }

    dynamic "condition" {
      for_each = length(local.role_sts_externalid) != 0 ? [
        true] : []
      content {
        test = "StringEquals"
        variable = "sts:ExternalId"
        values = local.role_sts_externalid
      }
    }
  }
}