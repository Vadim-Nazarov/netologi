# Домашнее задание к занятию «Организация сети»

### Подготовка к выполнению задания

1. Домашнее задание состоит из обязательной части, которую нужно выполнить на провайдере Yandex Cloud, и дополнительной части в AWS (выполняется по желанию). 
2. Все домашние задания в блоке 15 связаны друг с другом и в конце представляют пример законченной инфраструктуры.  
3. Все задания нужно выполнить с помощью Terraform. Результатом выполненного домашнего задания будет код в репозитории. 
4. Перед началом работы настройте доступ к облачным ресурсам из Terraform, используя материалы прошлых лекций и домашнее задание по теме «Облачные провайдеры и синтаксис Terraform». Заранее выберите регион (в случае AWS) и зону.

---
### Задание 1. Yandex Cloud 

1. Создать пустую VPC. Выбрать зону.
2. Публичная подсеть.

 - Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
 - Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
 - Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.
3. Приватная подсеть.
 - Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
 - Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
 - Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.

Resource Terraform для Yandex Cloud:

- [VPC subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet).
- [Route table](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_route_table).
- [Compute Instance](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance).

---

### Ответ 1.

Пустая VPC

![изображение](https://github.com/user-attachments/assets/78bd2ec3-2f83-4241-8983-d9eeb76ccf79)

Публичная подсеть

![изображение](https://github.com/user-attachments/assets/4bcad42e-c755-4b3a-ba80-f75c920280e1)

NAT instance и ВМ

![изображение](https://github.com/user-attachments/assets/2105099f-475b-4ba1-819e-d2d87caa10f2)

Проверка доступа к интернету из ВМ в подсети pablic

![изображение](https://github.com/user-attachments/assets/5531129e-716c-40d8-9937-984865c75c3c)

Таблица маршрутизации

![изображение](https://github.com/user-attachments/assets/1fd554a0-6a7f-4b76-a3dd-57315763e3db)

Проверка доступности к интернету из private подсети

![изображение](https://github.com/user-attachments/assets/e2a8edaf-c635-40ee-a4df-46feed3b54fc)



[Terraform](https://github.com/Vadim-Nazarov/netologi/tree/main/clopro/manifests)





