resource "yandex_compute_instance" "compute-instance" {
  platform_id = "standard-v1"
  zone        = "ru-central1-a" 
  count = 6

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = var.image-id
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.internal-bastion-segment.id}"
    security_group_ids = ["${yandex_vpc_security_group.internal-bastion-sg.id}"]
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
