
module "network" {
  source = "./modules/network"

  create_network     = true
  create_external_ip = true
  zone               = "ru-central1-a"
  network_name       = "bastion-network"
  subnet_name        = "bastion-subnet"
  external_ip_name   = "bastion-external-ip"
  public_subnets = [
    {
      v4_cidr_blocks = ["172.16.17.0/28"]
      zone           = "ru-central1-a"
    }
  ]

  private_subnets = [
    {
      v4_cidr_blocks = ["172.16.16.0/24"]
      zone           = "ru-central1-a"
    }
  ]
}

module "dns" {
  source = "./modules/dns"

  dns_name           = "bastion-dns"
  network_id         = module.network.network_id
  public_domen_name  = "kds4wexp.ru."
  private_domen_name = "private.ru."
}

module "certificate" {
  source = "./modules/certificate"

  create-certificate-managed = true
  certificate_name           = "gitlab-cert"
  domains                    = ["kds4wexp.ru"]
  challenge_type             = "DNS_CNAME"
  dns_zone_id                = module.dns.dns-public-id
  ttl                        = 200
}

module "security_group" {
  source = "./modules/security_group"

  network_id              = module.network.network_id
  internal_v4_cidr_blocks = ["172.16.16.254/32"] #передать переменную bastion_ip
}

module "iam" {
  source = "./modules/iam"

  name = "k8s-account"
}

# add instance resources