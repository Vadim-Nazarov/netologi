output "VMS" {
 value = {
   instance_name = yandex_compute_instance.platform.name
   external_ip  =  yandex_compute_instance.platform.network_interface.0.nat_ip_address
   instance_name2 = yandex_compute_instance.platform2.name
   external_ip2 =  yandex_compute_instance.platform2.network_interface.0.nat_ip_address
   }
}

output "vm_external_ip_address_db" {
 value = yandex_compute_instance.platform2.network_interface.0.nat_ip_address
   description = "vm external ip"
}

output "vm_external_ip_address_web" {
 value = yandex_compute_instance.platform.network_interface.0.nat_ip_address
  description = "vm external ip2"
}
