output "bastion-ip" {
    value = yandex_compute_instance.bastion-host.network_interface.0.nat_ip_address
}

output "gitlab-ip" {
    value = yandex_compute_instance.gitlab.network_interface.0.ip_address
}

output "compute_instance-ip" {
    value = yandex_compute_instance.compute-instance[*].network_interface.0.ip_address 
}

