variable "key_pair_public_key" {
  description = "The key public key of key pair"
  type        = string
}

variable "environment" {
  description = "The environment"
}

variable "name" {
  type        = string
  description = "Name of key pair"
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}