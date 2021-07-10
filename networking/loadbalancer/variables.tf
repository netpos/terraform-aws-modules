variable "name" {
  type = string
  description = "The name of the load balancer"
}

variable "internal" {
  type = bool
  description = "True if internal load balancer"
}

variable "type" {
  type = string
  description = "The type of the lb"
}

variable "sg_ids" {
  type = list(string)
  description = "The sg ids to be associated with the load balancer"
}

variable "subnet_ids" {
  type = list(string)
  description = "The ids of the subnets to the loadbalancer be within"
}

variable "vpc_id" {
  type = string
  description = "The vpc id"
}

variable "environment" {
  type = string
}

variable "deletion_protection" {
  type = bool
  default = false
  description = "Enable Delete Protection"
}