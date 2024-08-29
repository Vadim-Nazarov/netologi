terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
   token = var.yc_token
   cloud_id  = "b1ga397ao4qr22ofjshl"
   folder_id = "b1golull73609mhvvdf6"
   zone      = "ru-central1-a"
  }

