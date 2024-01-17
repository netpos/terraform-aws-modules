variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnets_cidr" {
  type        = list
  description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
  type        = list
  description = "The CIDR block for the public subnet"
}

variable "environment" {
  description = "The environment"
}

variable "availability_zones" {
  type        = list
  description = "The az that the resources will be launched"
}

variable "create_gateway_endpoint" {
  type        = bool
  description = "Create a VPC endpoint"
}

variable "endpoint_services" {
  type        = list(string)
  description = "Services to create a VPC endpoint"
  default     = []
}

variable "create_nat_gateway" {
  type        = bool
  description = "Flag if create a nat gateway"
  default     = true
}

variable "nat_instance_id" {
  type        = string
  description = "NAT Instance ID"
  default     = null
}

variable "nat_gateway_type" {
  type        = string
  description = "Flag if create a nat instance (nat gateway need be false)"
  default     = "NAT_GATEWAY"

  validation {
    condition     = contains(["NAT_INSTANCE", "NAT_GATEWAY"], var.nat_gateway_type)
    error_message = "Allowed values for nat_gateway_type are \"NAT_INSTANCE\", or \"NAT_GATEWAY\"."
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags"
  default     = {}
}