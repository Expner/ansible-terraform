resource "yandex_cm_certificate" "kds4wexp-cert" {
  name    = "kds4wexp-cert"
  domains = ["kds4wexp.ru"]

  managed {
  challenge_type = "DNS_CNAME"
  }
}

