variable "key_pair_name" {
  type        = string
  description = "The key pair name"
}

variable "subnet_id" {
  type        = string
  description = "The subnet id"
}

variable "instance_type" {
  type        = string
  description = "The class type of the instance"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "boolean to indicate if instance need a public ip"
}

variable "source_dest_check" {
  type        = bool
  default     = true
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true"
}

variable "ami" {
  type        = string
  description = "The ami to be used"
}

variable "sg_ids" {
  type        = list(string)
  default     = []
  description = "Custom sgs to input in the ec2 security group"
}

variable "tags" {
  description = "tags"
  type        = object({})
  default     = {}
}