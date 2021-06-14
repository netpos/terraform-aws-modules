variable "auto_scalling_enable" {
  type = bool
  description = "Enable auto scalling resources"
  default = true
}

variable "max_capacity" {
  type = number
  description = "Max tasks capacity"
}

variable "min_capacity" {
  type = number
  description = "Min tasks capacity"
  default = 1
}

variable "name" {
  type = string
  description = "Target, policy and alarm name"
}

variable "cluster_name" {
  type = string
  description = "Cluster Name"
}

variable "service_name" {
  type = string
  description = "Service Name"
}

variable "cooldown" {
  type = number
  description = "Cooldown period"
  default = 60
}

variable "metric_aggregation" {
  type = string
  description = "The agregation metric used in policy"
  default = "Maximum"
}

variable "scaling_adjustment" {
  type = number
  description = "Task scale adjustment"
}

variable "comparison_operator" {
  type = string
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold"
}

variable "evaluation_periods" {
  type = number
  description = "Number of periods over which data is compared"
}

variable "metric_name" {
  type = string
  description = "Metric name"
}

variable "period" {
  type = number
  description = "The number of seconds of statistic is evaluated"
}

variable "statistic" {
  type = string
  default = "Statistic used"
}

variable "threshold" {
  type = number
}

variable "tags" {
  type = object({})
}