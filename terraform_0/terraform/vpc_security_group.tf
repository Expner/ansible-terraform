resource "yandex_vpc_security_group" "secure-bastion-sg" {
    name = "secure-bastion-sg"
    folder_id = var.folder-id
# network_id = "${yandex_vpc_network.external-bastion-network.id}"
    network_id = "${yandex_vpc_network.bastion-network.id}"
    ingress {
        description = "SSH"
        port = 22
        protocol = "TCP"
        v4_cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "HTTP"
        port = 80
        protocol = "TCP"
        predefined_target = "self_security_group"
    }
    ingress {
        description = "HTTPS"
        port = 443
        protocol = "TCP"
        predefined_target = "self_security_group"
    }
    ingress {
        description = "FTP"
        port = 21
        protocol = "TCP"
        predefined_target = "self_security_group"
    }
    ingress {
        protocol = "ANY"
        from_port = 0
        to_port = 65535
        v4_cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "HTTP"
        port = 80
        protocol = "TCP"
        predefined_target = "self_security_group"
    }
    egress {
        description = "HTTPS"
        port = 443
        protocol = "TCP"
        predefined_target = "self_security_group"
    }
    egress {
        description = "FTP"
        port = 21
        protocol = "TCP"
        predefined_target = "self_security_group"
    }
    egress {
        protocol = "ANY"
        from_port = 0
        to_port = 65535
        v4_cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "yandex_vpc_security_group" "internal-bastion-sg" {
    name = "internal-bastion-sg"
    folder_id = var.folder-id
# network_id = "${yandex_vpc_network.internal-bastion-network.id}" 
   network_id = "${yandex_vpc_network.bastion-network.id}"
    ingress {
        description = "SSH"
        port = 22
        protocol = "TCP"
        v4_cidr_blocks = [var.internal-bastion-sg-ingress-CIDR]
    }
    ingress {
        description = "HTTP"
        port = 80
        protocol = "TCP"
        v4_cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "HTTPS"
        port = 443
        protocol = "TCP"
        v4_cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "FTP"
        port = 21
        protocol = "TCP"
        v4_cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        protocol = "ANY"
        from_port = 0
        to_port = 65535
        v4_cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "SSH"
        port = 22
        protocol = "TCP"
        predefined_target = "self_security_group" 
    }
    egress {
        description = "HTTP"
        port = 80
        protocol = "TCP"
        v4_cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "HTTPS"
        port = 443
        protocol = "TCP"
        v4_cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "FTP"
        port = 21
        protocol = "TCP"
        v4_cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        protocol = "ANY"
        from_port = 0
        to_port = 65535
        v4_cidr_blocks = ["0.0.0.0/0"]
    }

}
