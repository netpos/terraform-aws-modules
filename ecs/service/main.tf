resource "aws_ecs_service" "ecs_service" {
  name = "${var.environment}-${var.project_name}"
  cluster = var.cluster_id
  task_definition = var.task_definition_arn
  desired_count = var.min_capacity
  force_new_deployment = true
  launch_type = "FARGATE"
  health_check_grace_period_seconds = var.health_check_grace_period_seconds

  network_configuration {
    subnets = var.subnet_ids
    assign_public_ip = false
    security_groups = var.service_sg
  }

  lifecycle {
    ignore_changes = [
      desired_count]
  }

  dynamic "load_balancer" {
    for_each = var.lb == null ? [
    ] : [
      var.lb]
    content {
      target_group_arn = load_balancer.value["target_group_arn"]
      container_name = load_balancer.value["container_name"]
      container_port = load_balancer.value["container_port"]
    }
  }
}