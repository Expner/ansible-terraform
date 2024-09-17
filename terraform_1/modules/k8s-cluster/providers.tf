terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token  =  var.token-id
  cloud_id  = var.cloud-id
  folder_id = var.folder-id
  zone      = "ru-central1-a"
 }