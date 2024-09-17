output "node-ip" {
    value = yandex_compute_instance.node[*].network_interface.0.ip_address 
}