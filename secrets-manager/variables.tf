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
  sensitive = true
  type      = string
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}