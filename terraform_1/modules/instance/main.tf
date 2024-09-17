 resource "yandex_compute_instance" "instance" {
  name                      = var.name
  zone                      = var.zone
  platform_id               = var.platform_id
  allow_stopping_for_update = true

  resources {
    cores                   = var.cores
    memory                  = var.memory
    core_fraction           = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id              = var.image_id
    }
  }

  dynamic "network_interface" {
    for_each                = try(var.network_interface, {})
    content {
      nat                   = network_interface.value["nat"]
      nat_ip_address        = network_interface.value["nat_ip_address"]
      ip_address            = network_interface.value["ip_address"]
      subnet_id             = network_interface.value["subnet_id"]
      security_group_ids    = network_interface.value["security_group_ids"]
    }
  }

  metadata = {
    ssh-keys                = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_dns_recordset" "recordset" {
    for_each                = try(var.recordset, {})
    zone_id                 = each.value.zone_id
    name                    = var.name
    type                    = "A"
    ttl                     = 200
    data                    = [yandex_compute_instance.instance.network_interface.0.nat_ip_address]
}