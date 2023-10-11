resource "local_file" "ansible_inventory" {
  content = templatefile(
    "${abspath(path.module)}/hosts.tftpl",
    {
      webservers = [for i in yandex_compute_instance.web : i]
      databases  = [for k, v in yandex_compute_instance.db : v]
      storage    = tolist([yandex_compute_instance.storage])
    }
  )
  filename = "${abspath(path.module)}/hosts.cfg"
}
