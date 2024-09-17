resource "yandex_iam_service_account_iam_member" "editor-account-iam" {
  service_account_id = "${yandex_iam_service_account.lab-sa.id}"
  role               = "editor"
  member             = "serviceAccount:${yandex_iam_service_account.lab-sa.id}"
}
