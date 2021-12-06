variable "name" {
  type = string
}
variable "sg_description" {
  description = "The sg description"
  type = string
}

variable "vpc_id" {
  type = string
  description = "The vpc id"
}

variable "create_sg" {
  type = bool
  description = "Boolean to indicate if sg is needed"
  default = true
}

variable "sg_ingress" {
  type = list(object({
    description = string
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
    security_groups = list(string)
    self = bool
  }))
  default = []
  description = "The sg inbound rules"
}