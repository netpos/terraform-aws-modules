resource "aws_lb_target_group" "ip_target_group" {
  count = var.create_target_group ? 1 : 0

  name = var.name
  port = var.port
  protocol = var.protocol
  target_type = "ip"
  vpc_id = var.vpc_id
  health_check {
    enabled = true
    interval = 30
    healthy_threshold = 5
    port = var.port
    protocol = "HTTP"
    unhealthy_threshold = 10
    path = var.healthcheck_path
  }
}
