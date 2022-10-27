variable "name" {
  description = "Group Name"
  type        = string
}

variable "path" {
  description = "Path"
  type        = string
  default     = "/"
}

variable "policies_arn" {
  description = "Policies ARN"
  type        = set(string)
  default     = []
}
