#resource "yandex_vpc_route_table" "nat_route" {
#  name = "nat_route"
#  network_id = "${yandex_vpc_network.internal-bastion-network.id}"
#  static_route {
#    destination_prefix  = "0.0.0.0/0"
#    next_hop_address    = "172.16.16.254"
#  }
#}


