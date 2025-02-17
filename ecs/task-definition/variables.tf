variable "create_task_definition" {
  type        = bool
  description = "Create task definition"
  default     = true
}

variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "task_definition" {
  type = object({
    port_mappings         = list(any)
    environment_variables = list(map(string))
    secret_variables      = list(map(string))
    image                 = string
    cpu                   = number
    aws_log_region        = string
    memory                = number
    memory_hard           = number
    has_softlimit         = bool
    has_hardlimit         = bool
    task_role_arn         = string
    execution_role_arn    = string
    ulimits               = list(any)
    extra_hosts           = list(any)
  })
}

variable "retention_in_days" {
  type = number
}

variable "log_group_name" {
  type = string
}

variable "network_mode" {
  type    = string
  default = "awsvpc"
}

variable "logs" {
  description = "log customize"
  type        = object({
    driver  = string
    options = map(string)
  })
  default = null
}

variable "tags" {
  type = map(string)
  description = "Tags"
  default = {}
}