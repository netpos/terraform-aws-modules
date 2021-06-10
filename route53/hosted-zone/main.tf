resource "aws_route53_zone" "zone" {
  name = var.domain_name
  comment = var.comment

  dynamic "vpc" {
    for_each = var.vpcs
    content {
      vpc_id = vpc.value
    }
  }
}