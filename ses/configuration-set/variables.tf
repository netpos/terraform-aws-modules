variable "create_sns" {
  type = bool
  default = true
  description = "If true create a new sns and sqs."
}

variable "sns_endpoint" {
  type = string
  description = "Endpoint to protocol desire."
}

variable "sns_protocol" {
  type = string
  description = "Desire protocol."
}

variable "sns_arn" {
  type = string
  default = null
  description = "Specific SNS topic."
}

variable "name" {
  type = string
  description = "Name of configuration set."
}

variable "tags" {
  type = map(string)
  default = {}
  description = "Tags"
}

variable "enabled_destination" {
  type = bool
  default = true
}

variable "matching_types" {
  type = list(string)
  default = [
    "send",
    "reject",
    "bounce",
    "complaint",
    "delivery",
    "open",
    "click",
    "renderingFailure"]
}
