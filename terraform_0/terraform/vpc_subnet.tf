resource "yandex_vpc_subnet" "external-bastion-segment" {
  name            = "external-bastion-segment"
  v4_cidr_blocks  = [var.external-bastion-segment-CIDR]
  zone            = "ru-central1-a"
#  network_id      = "${yandex_vpc_network.external-bastion-network.id}"
  network_id      = "${yandex_vpc_network.bastion-network.id}"
}

resource "yandex_vpc_subnet" "internal-bastion-segment" {
  name            = "internal-bastion-segment"
  v4_cidr_blocks =  [var.internal-bastion-segment-CIDR]
  zone            = "ru-central1-a"
# network_id      = "${yandex_vpc_network.internal-bastion-network.id}"
  network_id      = "${yandex_vpc_network.bastion-network.id}"
#  route_table_id  = "${yandex_vpc_route_table.nat_route.id}"
}

