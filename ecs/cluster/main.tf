resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.cluster_name
  capacity_providers = var.capacity_providers

  setting {
    name = "containerInsights"
    value = var.container_insights_value
  }

  tags = {
    environment = var.environment
  }
}

module "ecs_service_sg" {
  source = "../../networking/sg"
  name = "${var.environment}-ecs-service"
  sg_description = "${var.environment} Security Group"
  vpc_id = var.vpc_id
  sg_ingress = [
    {
      from_port = 0
      to_port = 65535
      description = "Ecs service sg access"
      protocol = "tcp"
      self = false
      cidr_blocks = []
      security_groups = var.loadbalancers_sg
    }
  ]
}