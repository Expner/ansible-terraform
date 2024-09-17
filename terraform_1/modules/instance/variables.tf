variable "name" {
  type                  = string
}

variable "zone" {
  type                  = string
  default               = "ru-central1-a"
}  
variable "platform_id" {
  type                  = string
  default               = "standard-v1"
}

variable "image_id" {
  type                  = string
  default               = "fd8s25j1obln4fsn1qor"
}

variable "network_interface" {
  type = map(object({
    nat                 = string
    nat_ip_address      = string
    ip_address          = string
    subnet_id           = string
    security_group_ids  = list(string)
  }))
  default = {
    nat                 = null
    nat_ip_address      = null
    ip_address          = null
    security_group_ids  = null
  }
}

variable "recordset" {
  type = map(object({
    zone_id             = string
    data                = list(string)
  }))
}

variable "cores" {
  type                  = number
  default               = 2
}

variable "memory" {
  type                  = number
  default               = 2
}

variable "core_fraction" {
  type                  = number
  default               = 20
}