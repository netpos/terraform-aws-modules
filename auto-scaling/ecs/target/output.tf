output "ecs-autoscaling-target" {
  value = {
    resource_id = var.auto_scalling_enable ? aws_appautoscaling_target.appautoscaling_target.resource_id[count.index] : null
    scalable_dimension = var.auto_scalling_enable ? aws_appautoscaling_target.appautoscaling_target.scalable_dimension[count.index] : null
    service_namespace = var.auto_scalling_enable ? aws_appautoscaling_target.appautoscaling_target.service_namespace[count.index] : null
  }
}