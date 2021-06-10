variable "environment" {
  description = "The environment"
}

variable "subnet_ids" {
  type = list
  description = "Subnet ids"
}

variable "vpc_id" {
  description = "The VPC id"
}

//variable "allowed_security_group_id" {
//  description = "The allowed security group id to connect on RDS"
//}

variable "allocated_storage" {
  default = "20"
  description = "The storage size in GB"
}

variable "monitoring_interval" {
  description = "Enhanced monitoring metrics"
}

variable "performance_insights_enabled" {
  description = "Is performance insights enabled"
}

variable "monitoring_role_arn" {
  description = "The arn for monitoring role"
}

variable "instance_class" {
  description = "The instance type"
}

variable "multi_az" {
  default = false
  description = "Muti-az allowed?"
}

variable "database_username" {
  description = "The username of the database"
  sensitive = true
}

variable "database_password" {
  description = "The password of the database"
  sensitive = true
}

variable "snapshot_identifier" {
  description = "The snapshot to create the database from"
}

variable "storage_encrypted" {
  description = "The password of the database"
}

variable "legacy_vpc_cidr_block" {
  description = "The legacy cidr block of vpc"
}