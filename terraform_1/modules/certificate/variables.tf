variable "certificate_name" {
  type    = string
}

variable "domains" {
  type    = list
}

variable "challenge_type" {
  type    = string
}

variable "dns_zone_id" {
  type    = string
}

variable "create-certificate-managed" {
  type    = bool
  default = false
}

variable "create-certificate-self-managed" {
  type    = bool
  default = false
}

variable "certificate" {
  type    = string
  default = null
}

variable "private_key" {
  type    = string
  default = null
}

variable "ttl" {
  type    = number
}