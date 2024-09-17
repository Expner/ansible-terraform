resource "yandex_dns_zone" "public-zone" {
    name = "public-zone"
    folder_id = var.folder-id
    zone = "kds4wexp.ru."
    public = true
}

#resource "yandex_dns_zone" "private-zone" {
#    name = "private-zone"
#    folder_id = var.folder-id
#    zone = "private.ru."
#    public = false
#    private_networks = [yandex_vpc_network.internal-bastion-network.id]
#}

