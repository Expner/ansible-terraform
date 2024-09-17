 resource "yandex_compute_instance" "bastion-host" {
  name        = "bastion-host"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      name     = "lab-disk"
      image_id = var.bastion-image-id
    }
  }

  network_interface {
    nat = true
    nat_ip_address = "${yandex_vpc_address.bastion-ip.external_ipv4_address.0.address}"
    subnet_id = "${yandex_vpc_subnet.external-bastion-segment.id}"
    security_group_ids = ["${yandex_vpc_security_group.secure-bastion-sg.id}"]
  }

  network_interface {
    ip_address = var.bastion-ip-address
    subnet_id = "${yandex_vpc_subnet.internal-bastion-segment.id}"
    security_group_ids = ["${yandex_vpc_security_group.internal-bastion-sg.id}"]
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
