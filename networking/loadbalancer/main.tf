resource "aws_lb" "lb" {
  name = var.name
  internal = var.internal
  load_balancer_type = var.type
  security_groups = var.sg_ids
  subnets = var.subnet_ids
  enable_deletion_protection = var.deletion_protection

  tags = {
    Name = var.name
    environment = var.environment
  }
}