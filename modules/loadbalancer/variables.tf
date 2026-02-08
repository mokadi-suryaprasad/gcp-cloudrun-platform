variable "region" {}

variable "services" {
  type = map(object({
    name = string
    path = string
  }))
}