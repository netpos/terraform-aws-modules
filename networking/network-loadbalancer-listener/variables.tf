variable "create_listener" {
  type = bool
}

variable "load_balancer_arn" {
  type = string
}
variable "port" {
  type = number
}
variable "protocol" {
  type = string
}
variable "target_group_arn" {
  type = string
}

