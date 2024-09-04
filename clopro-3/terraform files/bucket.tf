// Создание бакета с использованием ключа
resource "yandex_storage_bucket" "nazarov-v-netology-88" {
  access_key = var.sa-access-key
  secret_key = var.sa-secret-key
  bucket     = "nazarov-v-netology-88"
  max_size   = 10048576
  acl        = "public-read"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.main-key.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
 }

// Создание объекта в бакете
resource "yandex_storage_object" "my-object" {
  access_key = var.sa-access-key
  secret_key = var.sa-secret-key
  bucket     = "nazarov-v-netology-88"
  key        = "111.jpg"
  source     = "111.jpg"
  acl        = "public-read"
  depends_on = [
    yandex_storage_bucket.nazarov-v-netology-88
  ]
}

resource "yandex_storage_object" "site" {
  access_key = var.sa-access-key
  secret_key = var.sa-secret-key
  bucket     = "nazarov-v-netology-88"
  key = "index.html"
  source = "index.html"
acl        = "public-read"
  depends_on = [
    yandex_storage_bucket.nazarov-v-netology-88
  ]

}
