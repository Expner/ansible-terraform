#resource "yandex_vpc_network" "external-bastion-network" {
#  name = "external-bastion-network"
#  folder_id = var.folder-id
#}

#resource "yandex_vpc_network" "internal-bastion-network" {
#  name = "internal-bastion-network"
#  folder_id = var.folder-id
#}

resource "yandex_vpc_network" "bastion-network" {
  name = "bastion-network"
  folder_id = var.folder-id
}

