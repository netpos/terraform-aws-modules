variable "is_global_accelerator_enabled" {
  type    = bool
  default = false
}

variable "ip_address_type" {
  type    = string
  default = "IPV4"
}

variable "name" {
  type = string
}

variable "endpoint_arn" {
  type = string
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}