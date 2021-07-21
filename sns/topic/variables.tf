variable "enable_sns" {
  type = bool
  description = "Enable SNS resource"
}

variable "sns_topic_name" {
  type = string
  description = "Name"
}

variable "display_name" {
  type = string
  description = "Display Name"
  default = ""
}

variable "sns_topic_kms_key_id" {
  type = string
  description = "KMS Key ID to enable crypto"
  default = null
}

variable "tags" {
  type = map(string)
  description = "Tags for SNS resource"
  default = {}
}