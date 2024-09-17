resource "yandex_cm_certificate" "certificate-managed" {
  count             = var.create-certificate-managed ? 1 : 0
  name              = var.certificate_name
  domains           = var.domains

  managed {
    challenge_type  = var.challenge_type
  }
}

resource "yandex_cm_certificate" "certificate-self-managet" {
  count             = var.create-certificate-self-managed ? 1 : 0
  name              = var.certificate_name
  domains           = var.domains

  self_managed {
    certificate     = var.certificate
    private_key     = var.private_key
  }
}

resource "yandex_dns_recordset" "certificate-CNAME-recordset" {
  count             = var.create-certificate-managed ? 1 : 0
  zone_id           = var.dns_zone_id
  name              = yandex_cm_certificate.certificate-managed[0].challenges[0].dns_name
  type              = yandex_cm_certificate.certificate-managed[0].challenges[0].dns_type
  ttl               = var.ttl
  data              = [yandex_cm_certificate.certificate-managed[0].challenges[0].dns_value]
}