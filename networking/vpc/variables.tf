variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnets_cidr" {
  type = list
  description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
  type = list
  description = "The CIDR block for the public subnet"
}

variable "environment" {
  description = "The environment"
}

variable "availability_zones" {
  type = list
  description = "The az that the resources will be launched"
}

variable "create_gateway_endpoint" {
  type = bool
  description = "Create a VPC endpoint"
}

variable "endpoint_services" {
  type = list(string)
  description = "Services to create a VPC endpoint"
  default = null
  validation {
    condition = !var.create_gateway_endpoint || contains([
      "s3",
      "dynamodb"], var.endpoint_services)
    error_message = "Allowed values for endpoint_services are \"s3\" or \"dynamodb\"."
  }
}