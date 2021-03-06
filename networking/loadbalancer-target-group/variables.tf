variable "create_target_group" {
  type = bool
  description = "Create a target group"
  default = true
}

variable "name" {
  type = string
}

variable "port" {
  type = string
}

variable "healthcheck_port" {
  type = string
  default = null
}

variable "protocol" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "health_check_enabled" {
  type = bool
  default = true
}

variable "healthcheck_path" {
  type = string
}

variable "enabled_stickiness" {
  description = "Enable stickiness in target group"
  type = bool
  default = false
}

variable "stickiness" {
  description = "Stickiness properties"
  type = map(string)
  default = {
    enabled = true
    type = "lb_cookie"
  }
}

variable "target_type" {
  description = "The target type"
  type        = string
  default     = "ip"
}

variable "slow_start" {
  description = "Target slow start time in seconds"
  type        = number
  default     = 0
}
