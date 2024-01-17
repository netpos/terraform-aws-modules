variable "instance_id" {
  type        = string
  description = "The instance id to associate the elastic ip"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}