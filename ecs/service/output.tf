output "service_name" {
  value = concat(aws_ecs_service.ecs_service.*.name, [
    null])[0]
}