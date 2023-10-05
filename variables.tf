###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type = map(any)
  default = {
   serial-port-enable   = 1
   ssh-keys             = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCxECnGJz7pkRgYtymUEBgd54LoxapoFe5SmMWKHC079eMw3slx55kTOn6gtAohWvi2HJ2ThFNbNkI8TSqf7U9XdN4NlJoNkVhu04kfO2moKiEfQbdwSXI4z3YJeUucxR4Xe4nyqNaBEaZfnaGYS4EK37/P6d1XY3kZjzgdFHaXsArIpKImYz4cJ4hxQrCJ9mMFEKwLar3ziEQWf83BRHtZ4+RxQwPhlIihy8KFF6ERrJQQ5Zy28ruf1fPz35HOGhfTFz+/XJBTg6JhW+ZiF+nsG6vlRkZ25qkJjii1Bq1g/5MtOMlVEQHwEKQJue2dHKaKrSII/cCcPTCGnuXBBDHvzoJd9EtW0MQ0yKo1LCvXUgMzwze32CCgOTYASN5SLWANJfZTyaZDmCv0fAQaCMLsOObSusvrVQhd4T8N/rGPt052SaI63L7+SiQsq5eAmchgLSGg2wbYMiZE2kQym6dBrIVmF2mHzreLilF9mEYUgQocePrRS+zHo3zM9CqlSes= root@vn-VirtualBox"
  }
}

###yandex_compute_image vars

#variable "vm_web_image" {
#  type        = string
#  default     = "ubuntu-2004-lts"
#  description = "ubuntu release name"
#}

###yandex_compute_instance vars

#variable "vm_web_cores" {
#  type        = number
#  default     = 2
#  description = "cores"
#}

#variable "vm_web_mem" {
#  type        = number
#  default     = 1
#  description = "memory"
#}

#variable "vm_web_frac" {
#  type        = number
#  default     = 5
#  description = "fraction"
#}

variable "vm_web_web" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "vm1 name"
}

variable "vm_web_db" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "vm2 name"
}

variable "vm_web_resources" {
  type = map(number)
  default = {
    cores          = 2
    mem            = 1
    frac           = 5
 }
}

variable "vm_db_resources" {
  type = map(number)
  default = {
    cores          = 2
    mem            = 2
    frac           = 20
  }
}


