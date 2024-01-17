resource "aws_lb_listener" "aws_lb_listener" {
  load_balancer_arn = var.lb_arn
  port = var.port
  protocol = var.protocol
  ssl_policy = var.ssl_policy
  certificate_arn = var.certificate_arn

  dynamic "default_action" {
    for_each = local.is_fixed_response ? [
      1] : []
    content {
      type = "fixed-response"
      fixed_response {
        content_type = "application/json"
        status_code = "503"
      }
    }
  }

  dynamic "default_action" {
    for_each = local.is_http_redirect ? [
      1] : []
    content {
      type = "redirect"
      redirect {
        port = "443"
        protocol = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  }

  tags = var.tags
}

resource "aws_lb_listener_certificate" "lb_listener_certificate" {
  for_each = var.additional_certificate_arn
  listener_arn = aws_lb_listener.aws_lb_listener.arn
  certificate_arn = each.value
}

locals {
  is_fixed_response = var.default_action_type == "fixed-response"
  is_http_redirect = var.default_action_type == "http-to-https-redirect"
}