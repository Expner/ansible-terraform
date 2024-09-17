resource "yandex_dns_zone" "dns_zone" {
  for_each = try(var.dns_zone, {})
  name              = each.value.name
  zone              = each.value.zone
}
