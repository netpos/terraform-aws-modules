variable "name" {
  description = "Group Name"
  type        = string
}

variable "path" {
  description = "Path"
  type        = string
  default     = "/"
}

variable "groups" {
  description = "Groups Names"
  type        = set(string)
  default     = []
}

variable "tags" {
  description = "Tags"
  type        = object({})
  default     = {}
}
