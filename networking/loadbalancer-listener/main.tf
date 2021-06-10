resource "aws_lb_listener" "aws_lb_listener" {
  load_balancer_arn = var.lb_arn
  port = var.port
  protocol = var.protocol
  ssl_policy = var.ssl_policy
  certificate_arn = var.certificate_arn
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "application/json"
      status_code = "503"
    }
  }
}

resource "aws_lb_listener_certificate" "lb_listener_certificate" {
  for_each = var.additional_certificate_arn
  listener_arn = aws_lb_listener.aws_lb_listener.arn
  certificate_arn = each.value
}