variable "lb_arn" {
  type = string
}

variable "port" {
  type = string
}

variable "protocol" {
  type = string
}

variable "ssl_policy" {
  type = string
}

variable "certificate_arn" {
  type = string
}

variable "additional_certificate_arn" {
  type = set(string)
  default = []
}