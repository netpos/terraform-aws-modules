variable "name" {
  type = string
  description = "Alarme name"
}

variable "description" {
  type = string
  description = "Alarm description"
  default = ""
}

variable "comparison_operator" {
  type = string
  description = "Comparison operator"
}

variable "evaluation_periods" {
  type = number
  description = "Evaluation periods"
}

variable "namespace" {
  type = string
  description = "Metric namespace"
}

variable "dimensions" {
  type = map(string)
  description = "Metric dimension"
}

variable "metric_name" {
  type = string
  description = "Metric name"
}

variable "period" {
  type = number
  description = "Period in seconds"
  default = 60
}

variable "statistic" {
  type = string
  description = "Statistic used in metrics"
}

variable "threshold" {
  type = number
  description = "Value to compare metric"
}

variable "actions_enabled" {
  type = bool
  description = "Enable actions"
  default = true
}

variable "alarm_actions" {
  type = string
  description = "Alarm action ARN"
  default = null
}

variable "insufficient_data_actions" {
  type = string
  description = "Insufficient data action ARN"
  default = null
}

variable "ok_actions" {
  type = string
  description = "OK action ARN"
  default = null
}

variable "treat_missing_data" {
  type = string
  description = "Treat missing data"
  default = "missing"
}

variable "tags" {
  type = map(string)
  description = "Tags"
  default = {}
}