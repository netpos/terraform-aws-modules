variable "service_name" {
  type = string
  value = aws_ecs_service.ecs_service.name
}