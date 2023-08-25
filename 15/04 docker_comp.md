# Задача 1

Создайте собственный образ любой операционной системы (например, debian-11) с помощью Packer версии 1.5.0 (инструкция).

Чтобы получить зачёт, вам нужно предоставить скриншот страницы с созданным образом из личного кабинета YandexCloud.

# Ответ 1

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/cbf00db6-3218-4ad2-81e6-2f2998e720af)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/64df3f5e-522e-4b32-bbec-d3d3ad5528d9)


# Задача 2

2.1. Создайте вашу первую виртуальную машину в YandexCloud с помощью web-интерфейса YandexCloud.

2.2.* (Необязательное задание)
Создайте вашу первую виртуальную машину в YandexCloud с помощью Terraform (вместо использования веб-интерфейса YandexCloud). Используйте Terraform-код в директории (src/terraform).

Чтобы получить зачёт, вам нужно предоставить вывод команды terraform apply и страницы свойств, созданной ВМ из личного кабинета YandexCloud.

# Ответ 2

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/de863de3-7ede-4c72-8a1d-13b7a69c5bbb)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/ec274321-755a-48ca-9818-f88d2de75720)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/9542aeb1-b15d-4a43-83f2-839413c754d3)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/5f7e3de2-890e-4eb9-a52a-738821b3a7ef)

# Задача 3

С помощью Ansible и Docker Compose разверните на виртуальной машине из предыдущего задания систему мониторинга на основе Prometheus/Grafana. Используйте Ansible-код в директории (src/ansible).

Чтобы получить зачёт, вам нужно предоставить вывод команды "docker ps" , все контейнеры, описанные в docker-compose, должны быть в статусе "Up".

# Ответ 3
запустил ansible-playbook

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/ebd69a45-0743-4951-9c64-838fe83c574b)

зашли по ssh -i /root/ansible/id_rsa centos@158.160.98.30
все стартануло:

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/c0afa0ba-2e77-4330-918b-d97a174163d5)


# Задача 4

    Откройте веб-браузер, зайдите на страницу http://<внешний_ip_адрес_вашей_ВМ>:3000.
    Используйте для авторизации логин и пароль из .env-file.
    Изучите доступный интерфейс, найдите в интерфейсе автоматически созданные docker-compose-панели с графиками(dashboards).
    Подождите 5-10 минут, чтобы система мониторинга успела накопить данные.

Чтобы получить зачёт, предоставьте:

    скриншот работающего веб-интерфейса Grafana с текущими метриками, как на примере ниже.

# Ответ 4

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/72aabebc-d5e9-4f33-bb20-fbcf268651a6)








