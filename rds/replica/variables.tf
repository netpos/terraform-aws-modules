variable "create_replica" {
  type        = bool
  default     = true
  description = "Boolean to create or not a read replica"
}

variable "identifier" {
  type        = string
  description = "Db identifier"
}

variable "master_instance_arn" {
  type        = string
  description = "The master instance arn"
}

variable "instance_class" {
  type        = string
  description = "The instance class to be used in this replica"
}

variable "allocated_storage" {
  type        = number
  description = "The size of allocated storage"
}

variable "max_allocated_storage" {
  type        = number
  default     = null
  description = "The max size of allocated storage"
}

variable "multi_az" {
  type        = bool
  description = "If this instance needs to be multi-az"
  default     = false
}

variable "security_group_ids" {
  type        = list(string)
  description = "The security group which this instance will use"
}

variable "cloudwatch_logs_exports" {
  type        = list(string)
  description = "Cloudwatch log exports"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}

variable "db_instance_tags" {
  description = "DB Instance Tags"
  type        = map(string)
  default     = {}
}