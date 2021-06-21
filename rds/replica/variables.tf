variable "create_replica" {
  type = bool
  default = true
  description = "Boolean to create or not a read replica"
}

variable "provider" {
  type = string
  default = null
  description = "The provider to be used to create the resources"
}

variable "identifier" {
  type = string
  description = "Db identifier"
}

variable "subnet_ids" {
  type = list(string)
  description = "The instance subnet ids"
}

variable "master_instance_arn" {
  type = string
  description = "The master instance arn"
}

variable "instance_class" {
  type = string
  description = "The instance class to be used in this replica"
}

variable "allocated_storage" {
  type = string
  description = "The size of allocated storage"
}

variable "kms_key_id" {
  type = string
  description = "The Kms key id to be used"
}

variable "multi_az" {
  type = bool
  description = "If this instance needs to be multi-az"
  default = false
}

variable "security_group_id" {
  type = string
  description = "The security group which this instance will use"
}