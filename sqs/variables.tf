variable "name" {
  type = string
  description = "Name of configuration queue."
}

variable "delay_seconds" {
  type = number
  default = 90
}

variable "max_message_size" {
  type = number
  default = 2048
}

variable "message_retention_seconds" {
  type = number
  default = 86400
}

variable "receive_wait_time_seconds" {
  type = number
  default = 10
}

variable "fifo_queue" {
  type = bool
  default = false
}

variable "content_based_deduplication" {
  type = bool
  default = false
}

variable "redrive_policy" {
  type = string
  default = null
  description = ""
}

variable "deduplication_scope" {
  type = string
  default = null
  description = ""
}

variable "fifo_throughput_limit" {
  type = string
  default = null
  description = ""
}

variable "kms_master_key_id" {
  type = string
  default = null
  description = ""
}

variable "kms_data_key_reuse_period_seconds" {
  type = number
  default = null
  description = ""
}

variable "source_access_arn" {
  type = string
  description = "Arn source of policy."
  default = null
}

variable "create_policy_allow_access" {
  type = bool
  default = false
  description = "If true create a new policy."
}

variable "tags" {
  type = map(string)
  default = {}
  description = "Tags"
}

variable "source_queue_arn" {
  type = list(string)
  description = "The list of queue`s arn to be used as source in dead letter queue"
}
