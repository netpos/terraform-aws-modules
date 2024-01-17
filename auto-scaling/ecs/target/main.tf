resource "aws_appautoscaling_target" "appautoscaling_target" {
  count = var.auto_scalling_enable ? 1 : 0
  max_capacity = var.max_capacity
  min_capacity = var.min_capacity
  resource_id = "service/${var.cluster_name}/${var.service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs"
}