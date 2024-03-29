resource "aws_ecs_cluster" "ecs_cluster" {
  name               = var.cluster_name
  capacity_providers = var.capacity_providers
  dynamic "default_capacity_provider_strategy" {
    for_each = var.default_capacity_provider_strategy
    content {
      capacity_provider = default_capacity_provider_strategy.value["capacity_provider"]
      weight            = default_capacity_provider_strategy.value["weight"]
      base              = default_capacity_provider_strategy.value["base"]
    }
  }

  setting {
    name  = "containerInsights"
    value = var.container_insights_value
  }

  tags = var.tags
}

module "ecs_service_sg" {
  source         = "../../networking/sg"
  name           = "${var.environment}-ecs-service"
  sg_description = "${var.environment} Security Group"
  vpc_id         = var.vpc_id
  sg_ingress     = [
    {
      from_port       = 0
      to_port         = 65535
      description     = "Ecs service sg access"
      protocol        = "tcp"
      self            = false
      cidr_blocks     = []
      security_groups = var.loadbalancers_sg
    }
  ]

  tags = var.tags
}