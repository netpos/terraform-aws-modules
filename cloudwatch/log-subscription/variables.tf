variable "name" {
  type = string
  description = "Log subscription name"
}

variable "destination_arn" {
  type = string
  description = "Destination ARN"
}

variable "filter_pattern" {
  type = string
  description = "Filter pattern"
  default = ""
}

variable "log_group_name" {
  type = string
  description = "Log group name"
}

variable "iam_for_lambda_arn" {
  type = string
  default = null
}

variable "distribution" {
  type = string
  default = null
}