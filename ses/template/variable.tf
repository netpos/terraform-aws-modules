variable "templates" {
  type = list(object({
    name = string
    subject = string
    html = string
    text = string
  }))
  description = "Templates list"
}

variable "prefix_name" {
  type = string
  description = "Prefix name"
  default = ""
}

variable "from_file" {
  type = bool
  description = "Load from file or input direct text"
  default = true
}