resource "aws_lb_listener" "aws_nlb_listener" {
  count = var.create_listener ? 1 : 0

  load_balancer_arn = var.load_balancer_arn

  port              = var.port
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}