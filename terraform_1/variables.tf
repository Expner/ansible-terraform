variable "token-id" {
  type                    = string
}

variable "cloud-id" {
  type                    = string
}

variable "folder-id" {
  type                    = string
}

variable "bastion-ip-address" {
  type                    = string
}

variable "internal-bastion-sg-ingress-CIDR" {
  type                    = string
}

variable "instance_object" {
  type = map(object({
    name                  = string
    platform_id           = optional(string)
    cores                 = optional(number)
    memory                = optional(number)
    core_fraction         = optional(number)
    image_id              = optional(string)
    nat                   = optional(string)
    nat_ip_address        = optional(string)
    ip_address            = optional(string)
    subnet_id             = optional(string)
    network_interface = map(object({
      nat                 = optional(string)
      nat_ip_address      = optional(string)
      ip_address          = optional(string)
      subnet_id           = string
      security_group_ids  = optional(list(string))  
    }))
    recordset = map(object({
      zone_id             = string
      data                = list(string)
    }))
  }))
}

variable "networks" {
  type = map(object({
    name              = string

    subnets = map(object({
      v4_cidr_blocks  = list(string)
      zone            = string
      description     = optional(string)
      name            = optional(string)
      folder_id       = optional(string)
    }))

    external_ips = map(object({
      name            = string
      zone_id         = string
    }))
  }))
}

variable "dns_zone" {
  type = map(object({
    zone = string
    name = optional(string)
    public = optional(string)
    private_networks = optional(list(string))
  }))

  default = null
}