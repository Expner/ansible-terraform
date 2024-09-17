resource "yandex_dns_recordset" "node-recordset" {
    for_each = tomap({
        vm-0 = yandex_compute_instance.node[0].network_interface.0.ip_address
        vm-1 = yandex_compute_instance.node[1].network_interface.0.ip_address
        vm-2 = yandex_compute_instance.node[2].network_interface.0.ip_address
        vm-3 = yandex_compute_instance.node[3].network_interface.0.ip_address
        vm-4 = yandex_compute_instance.node[4].network_interface.0.ip_address
        vm-5 = yandex_compute_instance.node[5].network_interface.0.ip_address
        })
    zone_id = yandex_dns_zone.private-zone.id
    name = "${each.key}"
    type = "A"
    ttl = 200
    data = [each.value]
    depends_on = [ yandex_compute_instance.node ]
}