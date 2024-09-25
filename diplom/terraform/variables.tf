variable "token" {
  type        = string
  description = "y0_AgAAAABIW9U-AATuwQAAAAEPI2S8AABMd2fgsN5MRI6C5WYI6FEH0_HXvQ"
}

variable "cloud_id" {
  type        = string
  description = "b1ga397ao4qr22ofjshl"
}

variable "folder_id" {
  type        = string
  description = "b1golull73609mhvvdf6"
}

variable "default_zone_a" {
  type    = string
  default = "ru-central1-a"
}

variable "default_zone_b" {
  type    = string
  default = "ru-central1-b"
}

variable "default_zone_d" {
  type    = string
  default = "ru-central1-d"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "Name for VPC network & subnets"
}

variable "public_image" {
  type        = string
  default     = "fd8vljd295nqdaoogf3g"
  description = "Yandex.Compute image ID"
}


variable "public_resources" {
  type = map(number)
  default = {
    cores          = 2
    memory         = 4
    core_fraction  = 20
    size           = 60
 }
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"  # Укажите здесь путь к вашему открытому ключу SSH
}

variable "public_resources_node" {
  type = map(number)
  default = {
    cores          = 2
    memory         = 2
    core_fraction  = 20
    size           = 40
 }
}


variable "teamcity_resources_server" {
  type = map(number)
  default = {
    cores          = 2
    memory         = 4
    core_fraction  = 100
    size           = 60
 }
}

variable "teamcity_resources_agent" {
  type = map(number)
  default = {
    cores          = 2
    memory         = 2
    core_fraction  = 20
    size           = 60
 }
}
