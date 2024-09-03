//Создание Instance Group
resource "yandex_compute_instance_group" "ig-1" {
  name                = "ig-1"
  folder_id           = "b1golull73609mhvvdf6"
  service_account_id  = "ajedl8lcrb3grvaj3l75"
  deletion_protection = "false"
  instance_template {
    platform_id = "standard-v1"
    resources {
      memory = 2
      cores  = 2
    }

    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"
        size = 4
      }
    }

    network_interface {
      subnet_ids = [yandex_vpc_subnet.public.id]
    }

    metadata = {
      user-data = file("index.yaml")
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = ["ru-central1-b"]
  }

  deploy_policy {
    max_unavailable = 2
    max_creating    = 2
    max_expansion   = 2
    max_deleting    = 2
  }
 }
