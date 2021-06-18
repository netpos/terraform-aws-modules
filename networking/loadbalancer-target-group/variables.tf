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

variable "protocol" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "healthcheck_path" {
  type = string
}