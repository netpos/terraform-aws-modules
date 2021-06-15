output "ecs-autoscaling-target" {
  value = {
    resource_id = length(aws_appautoscaling_target.appautoscaling_target.resource_id) < 0 ? null : element(aws_appautoscaling_target.appautoscaling_target.resource_id, 0)
    scalable_dimension = length(aws_appautoscaling_target.appautoscaling_target.scalable_dimension) < 0 ? null : element(aws_appautoscaling_target.appautoscaling_target.scalable_dimension, 0)
    service_namespace = length(aws_appautoscaling_target.appautoscaling_target.service_namespace) < 0 ? null : element(aws_appautoscaling_target.appautoscaling_target.service_namespace, 0)
  }
}