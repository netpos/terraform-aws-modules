output "ecs-autoscaling-target" {
  value = {
    resource_id = aws_appautoscaling_target.appautoscaling_target.resource_id
    scalable_dimension = aws_appautoscaling_target.appautoscaling_target.scalable_dimension
    service_namespace = aws_appautoscaling_target.appautoscaling_target.service_namespace
  }
}