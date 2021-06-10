variable "vpcs" {
  default = []
  type = list(string)
}

variable "domain_name" {
  description = "The domain name to be used"
}

variable "comment" {
  default = ""
  description = "Comment about zone"
}