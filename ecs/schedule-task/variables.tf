variable "schedule_task_enabled" {
  type = bool
  description = "Enable schedule task"
}

variable "schedule_task_name" {
  type = string
  description = "Schedule task name"
}

variable "event_rule_schedule_expression" {
  type = string
  description = "Cron expression"
}

variable "event_rule_description" {
  type = string
  description = "Event rule description"
}

variable "tags" {
  type = object({})
  description = "Tags"
  default = {}
}

variable "ecs_cluster_arn" {
  type = string
  description = "ECS Cluster ARN"
}

variable "iam_cw_event_role_arn" {
  type = string
  description = "Cloudwatch Event Role with ECS permission ARN"
}

variable "launch_type" {
  type = string
  description = "FARGATE or EC2"
  default = "FARGATE"
}

variable "ecs_task_count" {
  type = number
  description = "Task count"
}

variable "ecs_task_definition_arn" {
  type = string
  description = "Task arn"
}

variable "network_configuration" {
  type = object({
    subnets = list(string)
    security_groups = list(string)
    assign_public_ip = bool
  })
  description = "Network configuration if network mode is awsvpc"
  default = null
}

