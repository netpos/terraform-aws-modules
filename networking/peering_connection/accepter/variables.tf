variable "has_peer" {
  type = bool
  description = "Enable peer connection"
}

variable "peer_id" {
  type = string
  description = "Peering connection ID"
}

variable "auto_accept" {
  type = bool
  default = true
  description = "Auto accept peering connection"
}

variable "route_table_id" {
  type = list(string)
  description = "Routes table to associate"
  default = []
}

variable "tags" {
  description = "Tags"
  type = map(string)
  default = {}
}