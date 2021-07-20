variable "enable_subscription" {
  type = bool
  description = "Enable topic subscription"
}

variable "sns_topic_arn" {
  type = string
  description = "Topic ARN"
}

variable "protocol" {
  type = string
  description = "Subscription protocol"
}

variable "endpoint" {
  type = string
  description = "Subscription endpoint"
}

variable "filter_policy" {
  type = string
  description = "Filter policy"
  default = null
}