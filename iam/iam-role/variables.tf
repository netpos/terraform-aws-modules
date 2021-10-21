variable "trusted_role_actions" {
  description = "Actions of STS"
  type = list(string)
  default = [
    "sts:AssumeRole"]
}

variable "trusted_role_arns" {
  description = "ARNs of AWS entities who can assume these roles"
  type = list(string)
  default = []
}

variable "trusted_role_services" {
  description = "AWS Services that can assume these roles"
  type = list(string)
  default = []
}

variable "role_sts_externalid" {
  description = "STS ExternalId condition values to use with a role (when MFA is not required)"
  type = any
  default = []
}

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
  description = "List of inline policies"
}

variable "managed_policy_arns" {
  type = set(string)
  description = "Set of managed arn policies"
  default = []
}