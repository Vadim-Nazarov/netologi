# Создание сети

resource "yandex_vpc_network" "network-1" {
  name = "network-1"
}

# Создание подсетей

resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.20.0/24"]
  route_table_id = yandex_vpc_route_table.nat-instance-route.id
}

# Создание ВМ NAT-instance и ВМ для тестирования

data "yandex_compute_image" "ubuntu_image" {
  family = "ubuntu-2204-lts"
}

data "yandex_compute_image" "nat-instance-ubuntu" {
  family = "nat-instance-ubuntu"
}

# Создание ВМ NAT-instance

resource "yandex_compute_instance" "nat-instance" {
  name                      = "nat-instance"
  platform_id               = "standard-v3"
  zone                      = "ru-central1-b"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "fd8qmbqk94q6rhb4m94t"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat      = "true"
    ip_address = "192.168.10.254"
  }
  metadata = {
    user-data = "${file("./metadata.yml")}"
 }
}

# Создание  route table and static route

resource "yandex_vpc_route_table" "nat-instance-route" {
  name       = "nat-instance-route"
  network_id = yandex_vpc_network.network-1.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = yandex_compute_instance.nat-instance.network_interface.0.ip_address
  }
}

# Создание ВМ test-public
resource "yandex_compute_instance" "vm-test-public" {
  name                      = "vm-test-public"
  zone                      = "ru-central1-b"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "fd864gbboths76r8gm5f"
      type        = "network-nvme"
      size        = "10"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }
  metadata = {
    user-data = "${file("./metadata.yml")}"
 }
}

# Создание ВМ test-private
resource "yandex_compute_instance" "vm-test-private" {
  name                      = "vm-test-private"
  zone                      = "ru-central1-b"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "fd864gbboths76r8gm5f"
      type        = "network-nvme"
      size        = "10"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private.id

  }
  metadata = {
    user-data = "${file("./metadata.yml")}"
 }
}
