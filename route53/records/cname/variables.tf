variable "zone_id" {
  description = "Record zone id"
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

variable "records" {
  type = list(string)
}