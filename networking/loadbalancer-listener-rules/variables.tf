variable "listener_arn" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "host_header_condition" {
  type = list(string)
}