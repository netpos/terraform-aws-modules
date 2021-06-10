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
    container_name = string
    container_port = string
  })
}

variable "subnet_ids" {
  type = list(string)
}

variable "service_sg" {
  type = list(string)
}

variable "health_check_grace_period_seconds" {
  type = number
}