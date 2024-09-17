output "external_id" {
  value = yandex_vpc_security_group.external_security_group.id
}

output "internal_id" {
  value = yandex_vpc_security_group.internal_security_group.id
}