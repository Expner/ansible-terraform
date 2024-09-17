resource "yandex_iam_service_account" "service_account" {
  name                = var.name
}

resource "yandex_iam_service_account_iam_member" "role_editor" {
  service_account_id  = yandex_iam_service_account.service_account.id
  role                = "editor"
  member              = "serviceAccount:${yandex_iam_service_account.service_account.id}"
}
