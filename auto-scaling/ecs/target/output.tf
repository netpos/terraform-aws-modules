output "ecs-autoscaling-target" {
  value = {
    resource_id = var.auto_scalling_enable ? aws_appautoscaling_target.appautoscaling_target[count.index].resource_id : null
    scalable_dimension = var.auto_scalling_enable ? aws_appautoscaling_target.appautoscaling_target[count.index].scalable_dimension : null
    service_namespace = var.auto_scalling_enable ? aws_appautoscaling_target.appautoscaling_target[count.index].service_namespace : null
  }
}