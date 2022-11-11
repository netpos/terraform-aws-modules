variable "name" {
  description = "The name of the repository"
  type        = string
}

variable "tags" {
  description = "tags"
  type        = object({})
  default     = {}
}

variable "lifecycle_policy" {
  description = "Lifecycle policy"
  type        = string
  default     = null
}