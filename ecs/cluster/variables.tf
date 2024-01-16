variable "cluster_name" {
  type        = string
  description = "The name of the cluster"
}

variable "container_insights_value" {
  type        = string
  description = "Container insights value. Allowed values are enabled or disabled"
  default     = "disabled"
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "loadbalancers_sg" {
  type = list(string)
}

variable "capacity_providers" {
  description = "ECS Cluster capacity providers"
  type        = list(string)
  default     = []
}

variable "default_capacity_provider_strategy" {
  type = list(object({
    capacity_provider = string
    weight            = optional(number)
    base              = optional(number)
  }))
  default = []
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}