variable "cluster_name" {
  type = string
  description = "The name of the cluster"
}

variable "container_insights_value" {
  type = string
  description = "Container insights value. Allowed values are enabled or disabled"
  default = "disabled"
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