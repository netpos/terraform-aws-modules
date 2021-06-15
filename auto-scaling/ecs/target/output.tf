output "ecs-autoscaling-target" {
  value = {
    resource_id = concat(aws_appautoscaling_target.appautoscaling_target.*.resource_id, [
      ""])[0]
    scalable_dimension = concat(aws_appautoscaling_target.appautoscaling_target.*.scalable_dimension, [
      ""])[0]
    service_namespace = concat(aws_appautoscaling_target.appautoscaling_target.*.service_namespace, [
      ""])[0]
  }
}