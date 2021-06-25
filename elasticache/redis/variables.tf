variable "replication_group_id" {
  description = "Redis replication group name"
  type = string
}

variable "replication_group_description" {
  description = "Redis recplication group description"
  type = string
  default = var.replication_group_id
}

variable "apply_immediately" {
  description = "Apply immediately"
  type = bool
  default = false
}

variable "maintenance_window" {
  description = "Maintence window (ddd:hh24:mi-ddd:hh24:mi)"
  type = string
  default = "sun:06:00-sun:07:30"
}

variable "notification_topic_arn" {
  description = "ARN SNS Topic"
  type = string
  default = null
}

variable "node_type" {
  description = "Node type"
  type = string
}

variable "engine_version" {
  description = "Engine version"
  type = string
}

variable "port" {
  description = "Port"
  type = number
  default = 6379
}

variable "cluster_count" {
  description = "Number of shards"
  type = number
  default = 2
}

variable "parameter_group_name" {
  description = "Custom Parameter group"
  type = string
  default = null
}

variable "availability_zones" {
  description = "Availability zones"
  type = list(string)
  default = []
}

variable "security_group_ids" {
  description = "Security groups IDs"
  type = list(string)
  default = []
}

variable "create_security_groups" {
  description = "Create default security groups"
  type = bool
  default = false
}

variable "vpc_id" {
  description = "VPC Id to create security groups"
  type = string
  default = null
}

variable "ingress_sg_values" {
  description = "CIDRs and SGs with elasticache access"
  type = object({
    sg_ids = list(string)
    cidr_blocks = list(string)
  })
  default = {
    sg_ids = [],
    cidr_blocks = []
  }
}

variable "subnet_ids" {
  description = "Subnets of VPC"
  type = list(string)
  default = []
}

variable "automatic_failover_enabled" {
  description = "Automatic failover"
  type = bool
  default = false
}

variable "multi_az_enabled" {
  description = "Multi AZ"
  type = bool
  default = false
}

variable "at_rest_encryption_enabled" {
  description = "Rest encryption"
  type = bool
  default = false
}

variable "kms_key_id" {
  description = "KMS Key id to rest encryption"
  type = string
  default = null
}

variable "transit_encryption_enabled" {
  description = "Transit encryption"
  type = bool
  default = false
}

variable "auth_token" {
  description = "Auth key to password access"
  type = string
  default = null
}

variable "auto_minor_version_upgrade" {
  description = "Auto minor version upgrade"
  type = bool
  default = true
}

variable "snapshot_retention_limit" {
  description = "Snapshot retention days"
  type = number
  default = 0
}

variable "snapshot_window" {
  description = "Snapshot window"
  type = string
  default = "03:30-05:30"
}

variable "tags" {
  description = "Tags"
  type = map(string)
  default = {}
}