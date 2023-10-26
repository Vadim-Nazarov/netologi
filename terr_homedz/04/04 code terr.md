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
        "vpc_subnet_id" = "e9brfuftvo8u4q658gf0"
        "vpc_subnet_name" = "develop"
        "vpc_zone" = "ru-central1-a"
      }
      
      terraform-docs markdown --output-file Readme_vpc.md ./vpc
      
[Документация](https://github.com/Vadim-Nazarov/netologi/blob/main/terr_homedz/04/src/vpc/Readme_vpc.md)

# Задание 3

# Задание 4

   

