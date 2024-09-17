resource "yandex_iam_service_account" "lab-sa" {
  name        = "lab-sa"
  folder_id = var.folder-id
}