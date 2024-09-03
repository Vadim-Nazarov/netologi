# Создание ВМ NAT-instance

data "yandex_compute_image" "nat-instance-ubuntu" {
  family = "nat-instance-ubuntu"
}

# Создание ВМ NAT-instance

resource "yandex_compute_instance" "nat-instance" {
  name        = "nat-instance"
  platform_id = "standard-v3"
  zone        = "ru-central1-b"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8qmbqk94q6rhb4m94t"
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public.id
    nat        = "true"
    ip_address = "192.168.10.254"
  }
  metadata = {
    user-data = "${file("./metadata.yml")}"
  }
}
