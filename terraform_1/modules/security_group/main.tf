resource "yandex_vpc_security_group" "external_security_group" {
  network_id                    = var.network_id
  name                          = "external bastion sg"
  ingress {
    description                 = "external network"
    protocol                    = "TCP"
    port                        = 22
    v4_cidr_blocks              = ["0.0.0.0/0"]
  }
}

resource "yandex_vpc_security_group" "internal_security_group" {
  network_id                    = var.network_id
  name                          = "internal bastion sg"
  ingress {
    description                 = "internal network"
    protocol                    = "TCP"
    port                        = 22
    v4_cidr_blocks              = var.internal_v4_cidr_blocks
  }

  egress {
    description                 = "internal network"
    protocol                    = "TCP"
    port                        = 22
    predefined_target           = "self_security_group"
  }
}