resource "yandex_compute_instance" "gitlab" {
  name        = "gitlab"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      size = 20
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
