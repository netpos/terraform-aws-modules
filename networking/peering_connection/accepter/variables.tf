variable "peer_id" {
  type = string
  description = "Peering connection ID"
}

variable "auto_accept" {
  type = bool
  default = true
  description = "Auto accept peering connection"
}

variable "create_routes" {
  type = bool
  description = "Create peering connection routes in VPC route tables"
}

variable "tags" {
  description = "Tags"
  type = map(string)
  default = {}
}