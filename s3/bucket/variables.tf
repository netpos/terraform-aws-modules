variable "bucket_name" {
  type        = string
  description = "Bucket name"
}

variable "bucket_acl" {
  type        = string
  description = "The canned ACL to apply to the bucket. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write"
}

variable "block_public_access" {
  type        = bool
  default     = false
  description = "Block all public actions in bucket"
}

variable "tags" {
  type        = object({})
  default     = {}
  description = "Bucket tags"
}
