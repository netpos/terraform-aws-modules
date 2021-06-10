variable "zone_id" {
  description = "Record zone id"
}

variable "alias_zone_id" {
  description = "The alias zoned id"
}

variable "dns_name" {
  description = "The dns name"
}

variable "name" {
  description = "The name of the record"
}

variable "type" {
  description = "The type of de record"
}

variable "ttl" {
  default = 300
  description = "Time to live of record"
}