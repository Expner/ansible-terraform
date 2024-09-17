variable "token-id" {
  type                    = string
}

variable "cloud-id" {
  type                    = string
}

variable "folder-id" {
  type                    = string
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
