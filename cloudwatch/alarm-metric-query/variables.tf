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

variable "datapoints_to_alarm" {
  type = number
  description = "Data points to alarm"
  default = null
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
  type = list(string)
  description = "Alarm action ARNs"
  default = []
}

variable "insufficient_data_actions" {
  type = list(string)
  description = "Insufficient data action ARNs"
  default = []
}

variable "ok_actions" {
  type = list(string)
  description = "OK action ARNs"
  default = []
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

variable "metric_query" {
  type = map(object({
    expression = optional(string)
    label = string
    metric = optional(object({
      namespace = string
      dimensions = optional(map(string))
      unit = optional(string)
      metric_name = string
      period = number
      stat = string
    }))
    return_data = bool
  }))
}
