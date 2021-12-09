variable "ecs_service_enabled" {
  type        = bool
  description = "Create a service"
  default     = true
}

variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "cluster_id" {
  type = string
}

variable "task_definition_arn" {
  type = string
}

variable "min_capacity" {
  type = number
}

variable "lb" {
  type = object({
    target_group_arn = string
    container_name   = string
    container_port   = string
  })
}

variable "lb_list" {
  type    = list(object({
    target_group_arn = string
    container_name   = string
    container_port   = string
  }))
  default = []
}

variable "subnet_ids" {
  type = list(string)
  default = []
}

variable "service_sg" {
  type = list(string)
  default = []
}

variable "health_check_grace_period_seconds" {
  type = number
}

variable "enable_execute_command" {
  type    = bool
  default = false
}

variable "launch_type" {
  description = "ECS Service launch type"
  type        = string
  default     = "FARGATE"
}

variable "capacity_provider_strategy" {
  type    = list(object({
    capacity_provider = string
    weight            = optional(number)
    base              = optional(number)
  }))
  default = []
}

variable "assign_public_ip" {
  type = bool
  default = false
}