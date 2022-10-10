variable "create_replica" {
  type = bool
  default = true
  description = "Boolean to create or not a read replica"
}

variable "identifier" {
  type = string
  description = "Db identifier"
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

variable "multi_az" {
  type = bool
  description = "If this instance needs to be multi-az"
  default = false
}

variable "security_group_ids" {
  type = list(string)
  description = "The security group which this instance will use"
}

variable "engine" {
  description = "RDS Engine"
  type = string
}

variable "engine_version" {
  description = "RDS Engine Version"
  type = string
}

variable "cloudwatch_logs_exports" {
  type = list(string)
  description = "Cloudwatch log exports"
}