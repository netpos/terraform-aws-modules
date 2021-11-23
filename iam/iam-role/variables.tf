variable "name" {
  description = "The name of the role"
  type = string
  default = ""
}

variable "inline_policies" {
  type = list(object({
    name = string
    policy = string
  }))
  default = []
  description = "List of inline policies"
}

variable "managed_policy_arns" {
  type = set(string)
  description = "Set of managed arn policies"
  default = []
}

variable "assume_role_policy" {
  description = "Assume role policy"
  type = string
}

variable "create_instance_profile" {
  description = "Boolean to indicate when to create as instance profile"
  type = bool
  default = false
}