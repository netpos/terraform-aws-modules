resource "aws_lb" "lb" {
  name = var.name
  internal = var.internal
  load_balancer_type = var.type
  security_groups = var.sg_ids
  subnets = var.subnet_ids
  enable_deletion_protection = false
  tags = {
    Name = var.name
    environment = var.environment
  }
}