variable "name" {
  type        = string
  description = "Name of the secret"
}

variable "description" {
  type        = string
  description = "Description about the secret"
}

variable "policy" {
  type        = string
  description = "Policy to attach in secret"
  default     = null
}

variable "secret_string" {
  type = string
}

variable "tags" {
  type    = object({})
  default = {}
}