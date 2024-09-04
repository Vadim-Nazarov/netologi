resource "yandex_kms_symmetric_key" "main-key" {
  name              = "main-key"
  description       = "my main main-key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h"
  lifecycle {
    prevent_destroy = true
  }
}
