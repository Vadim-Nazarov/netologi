// Создание бакета с использованием ключа
resource "yandex_storage_bucket" "nazarov-v-netology-88" {
  access_key = var.sa-access-key
  secret_key = var.sa-secret-key
  bucket     = "nazarov-v-netology-88"
  max_size   = 10048576
  acl        = "public-read"
  force_destroy = "true"
  website {
    index_document = "index.html"
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
