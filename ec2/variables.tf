variable "key_pair_name" {
  type = string
  description = "The key pair name"
}

variable "subnet_id" {
  type = string
  description = "The subnet id"
}

variable "name" {
  type = string
  description = "The name of the ec2 instance"
}

variable "instance_type" {
  type = string
  description = "The class type of the instance"
}

variable "associate_public_ip_address" {
  type = bool
  description = "boolean to indicate if instance need a public ip"
}

variable "ami" {
  type = string
  description = "The ami to be used"
}

variable "sg_ids" {
  type = list(string)
  default = []
  description = "Custom sgs to input in the ec2 security group"
}

variable "environment" {
  type = string
}