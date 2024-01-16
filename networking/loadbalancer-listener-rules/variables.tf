variable "create_rule" {
  type = bool
  description = "Create a rule"
  default = true
}

variable "listener_arn" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "host_header_condition" {
  type = list(string)
}

variable "tags" {
  type = map(string)
  description = "Tags"
  default = {}
}