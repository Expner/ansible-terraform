variable "dns_zone" {
  type = map(object({
    zone = string
    name = optional(string)
    public = optional(string)
    private_networks = optional(list(string), yandex_vpc_network.networks.network_id)
  }))
  default = null
}