output "task_definition_arn" {
  value = concat(aws_ecs_task_definition.ecs_task_definition.*.arn, [
    null])[0]
}