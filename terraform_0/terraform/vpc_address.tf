resource "yandex_vpc_address" "bastion-ip" {
    name = "bastion-ip"
    external_ipv4_address {
        zone_id = "ru-central1-a"
    }
}