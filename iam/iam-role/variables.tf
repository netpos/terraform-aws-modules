variable "name" {
  description = "The name of the role"
  type        = string
  default     = ""
}

variable "assume_role_policy" {
  description = "The policy to be attached"
  type        = string
  default     = ""
}