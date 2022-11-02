resource "aws_lb_target_group" "ip_target_group" {
  count = var.create_target_group ? 1 : 0

  name        = var.name
  port        = var.port
  protocol    = var.protocol
  target_type = var.target_type
  vpc_id      = var.vpc_id
  slow_start  = var.protocol == "HTTP" ? var.slow_start : null

  dynamic "health_check" {
    for_each = var.health_check_enabled ? [
      true
    ] : []
    content {
      enabled             = var.health_check_enabled
      interval            = 30
      healthy_threshold   = 5
      port                = local.healthcheck_port
      protocol            = "HTTP"
      unhealthy_threshold = 10
      path                = var.healthcheck_path
    }
  }

  dynamic "stickiness" {
    for_each = local.stickiness
    content {
      enabled         = lookup(stickiness, "enabled", true)
      type            = lookup(stickiness, "type", var.default_stickiness_type)
      cookie_name     = lookup(stickiness, "cookie_name", null)
      cookie_duration = lookup(stickiness, "cookie_duration", null)
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

locals {
  healthcheck_port = var.healthcheck_port != null ? var.healthcheck_port : var.port
  stickiness       = var.enabled_stickiness ? [
    var.stickiness
  ] : []
}
