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

variable "cluster_name" {
  type = string
  description = "Cluster Name"
}

variable "service_name" {
  type = string
  description = "Service Name"
}

variable "tags" {
  type = map(string)
  description = "Tags"
  default = {}
}