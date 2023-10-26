[Домашнее задание](https://github.com/Vadim-Nazarov/netologi/blob/main/terr_homedz/04/hw-04.md)

[Код заданий](https://github.com/Vadim-Nazarov/netologi/tree/main/terr_homedz/04/src)

# Задание 1
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/e730f60c-accc-4608-b0cd-2f8b1ff74f1e)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/93f5d556-ead9-4d3f-bfbb-ca81f2a0bde1)

# Задание 2
      module "vpc_dev" {
      "vpc_network_id" = "enpme4dr16ive32r4amq"
        "vpc_network_name" = "develop"
        "vpc_subnet_cidr" = tolist(["10.0.1.0/24",])
        "vpc_subnet_id" = "e6srduftvo8u4q765gf0"
        "vpc_subnet_name" = "develop"
        "vpc_zone" = "ru-central1-a"
      }
      
      terraform-docs markdown --output-file Readme_vpc.md ./vpc
      
[Документация](https://github.com/Vadim-Nazarov/netologi/blob/main/terr_homedz/04/src/vpc/Readme_vpc.md)

# Задание 3

- Cписок ресурсов в стейте.

            $ terraform state list
            data.template_file.cloudinit
            module.test-vm.data.yandex_compute_image.my_image
            module.test-vm.yandex_compute_instance.vm[0]
            module.vpc_dev.yandex_vpc_network.develop
            module.vpc_dev.yandex_vpc_subnet.develop
-  Удалить модули из стейта.

Запоминаем:

            $ terraform state show module.vpc_dev.yandex_vpc_subnet.develop | grep id
                id             = "e9bmadv89otv3h95qasd"

            $ terraform state show module.vpc_dev.yandex_vpc_network.develop | grep id
                id                        = "enpcf13da7rvq5en2ir9"

            $ terraform state show module.test-vm.yandex_compute_instance.vm[0] | grep id
                id                        = "fhm78924amudo6ir8mab"

Удаляем

            $ terraform state rm module.vpc_dev.yandex_vpc_subnet.develop module.vpc_dev.yandex_vpc_network.develop
            Removed module.vpc_dev.yandex_vpc_subnet.develop
            Removed module.vpc_dev.yandex_vpc_network.develop
            Successfully removed 2 resource instance(s).

            $ terraform state rm module.test-vm.yandex_compute_instance.vm[0]
            Removed module.test-vm.yandex_compute_instance.vm[0]
            Successfully removed 1 resource instance(s).

- Импортировать всё обратно.

            $ terraform import 'module.test-vm.yandex_compute_instance.vm[0]' fhm78924amudo6ir8mab
            $ terraform import 'module.vpc_dev.yandex_vpc_subnet.develop' e9bmadv89otv3h95qasd
            $ terraform import 'module.vpc_dev.yandex_vpc_network.develop' enpcf13da7rvq5en2ir9

# Задание 4

             required_providers {
                yandex = {
                  source = "yandex-cloud/yandex"
                }
              }
              required_version = ">= 0.13"
            }

            resource "yandex_vpc_network" "network" {
              name = var.env_name
            }
            
            resource "yandex_vpc_subnet" "subnet" {
              name = "${var.env_name}-${each.value.zone}"
              for_each = {
                for i, s in var.subnets : i => s
              }
              zone           = each.value.zone
              network_id     = yandex_vpc_network.network.id
              v4_cidr_blocks = each.value.cidr
            }

<details><summary>План выполнения:</summary>

root@vn-VirtualBox:~/dz/netologi/terr_homedz/04/src# terraform plan
data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=fa11c067a01d31c40184f7e0e0c8f5294a0b1ed8f535c10a784ca79fcd1cb8b8]
module.test-vm.data.yandex_compute_image.my_image: Reading...
module.test-vm.data.yandex_compute_image.my_image: Read complete after 0s [id=fd8q5m87s3v0hmp06i5c]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.test-vm.yandex_compute_instance.vm[0] will be created
  + resource "yandex_compute_instance" "vm" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + description               = "TODO: description; {{terraform managed}}"
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = "develop-web-0"
      + id                        = (known after apply)
      + labels                    = {
          + "env"     = "develop"
          + "project" = "undefined"
        }
      + metadata                  = {
          + "serial-port-enable" = "1"
          + "user-data"          = <<-EOT
                #cloud-config
                users:
                  - name: ubuntu
                    groups: sudo
                    shell: /bin/bash
                    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
                    ssh_authorized_keys:
                      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCxECnGJz7pkRgYtymUEBgd54LoxapoFe5SmMWKHC079eMw3slx55kTOn6gtAohWvi2HJ2ThFNbNkI8TSqf7U9XdN4NlJoNkVhu04kfO2moKiEfQbdwSXI4z3YJeUucxR4Xe4nyqNaBEaZfnaGYS4EK37/P6d1XY3kZjzgdFHaXsArIpKImYz4cJ4hxQrCJ9mMFEKwLar3ziEQWf83BRHtZ4+RxQwPhlIihy8KFF6ERrJQQ5Zy28ruf1fPz35HOGhfTFz+/XJBTg6JhW+ZiF+nsG6vlRkZ25qkJjii1Bq1g/5MtOMlVEQHwEKQJue2dHKaKrSII/cCcPTCGnuXBBDHvzoJd9EtW0MQ0yKo1LCvXUgMzwze32CCgOTYASN5SLWANJfZTyaZDmCv0fAQaCMLsOObSusvrVQhd4T8N/rGPt052SaI63L7+SiQsq5eAmchgLSGg2wbYMiZE2kQym6dBrIVmF2mHzreLilF9mEYUgQocePrRS+zHo3zM9CqlSes= root@vn-VirtualBox

                package_update: true
                package_upgrade: false
                packages:
                  - nginx
            EOT
        }
      + name                      = "develop-web-0"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8q5m87s3v0hmp06i5c"
              + name        = (known after apply)
              + size        = 10
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + resources {
          + core_fraction = 5
          + cores         = 2
          + memory        = 1
        }

      + scheduling_policy {
          + preemptible = true
        }
    }

  # module.vpc_dev.yandex_vpc_network.network will be created
  + resource "yandex_vpc_network" "network" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "develop"
      + subnet_ids                = (known after apply)
    }

  # module.vpc_dev.yandex_vpc_subnet.subnet["0"] will be created
  + resource "yandex_vpc_subnet" "subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "develop-ru-central1-a"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.0.1.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

  # module.vpc_prod.yandex_vpc_network.network will be created
  + resource "yandex_vpc_network" "network" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "production"
      + subnet_ids                = (known after apply)
    }

  # module.vpc_prod.yandex_vpc_subnet.subnet["0"] will be created
  + resource "yandex_vpc_subnet" "subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "production-ru-central1-a"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.0.1.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

  # module.vpc_prod.yandex_vpc_subnet.subnet["1"] will be created
  + resource "yandex_vpc_subnet" "subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "production-ru-central1-b"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.0.2.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-b"
    }

  # module.vpc_prod.yandex_vpc_subnet.subnet["2"] will be created
  + resource "yandex_vpc_subnet" "subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "production-ru-central1-c"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.0.3.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-c"
    }

Plan: 7 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + external_ip = [
      + (known after apply),
    ]

</details>

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/c3141e08-85d9-4a6d-8cf5-9364896bd61e)

