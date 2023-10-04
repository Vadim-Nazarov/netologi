# Задача 1
    - Изучите проект. В файле variables.tf объявлены переменные для yandex provider.
    - Переименуйте файл personal.auto.tfvars_example в personal.auto.tfvars. Заполните переменные (идентификаторы облака, токен доступа). Благодаря .gitignore этот файл не попадет в публичный репозиторий. Вы можете выбрать иной способ безопасно передать секретные данные в terraform.
    - Сгенерируйте или используйте свой текущий ssh ключ. Запишите его открытую часть в переменную vms_ssh_root_key.
    - Инициализируйте проект, выполните код. Исправьте возникшую ошибку. Ответьте в чем заключается ее суть?
    - Ответьте, что означает preemptible = true и core_fraction в параметрах ВМ? Как это может пригодится в процессе обучения? Ответ в документации Yandex cloud.

# Ответ 1

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/748c6cb9-44c6-4928-8ab4-698e22eeda7b)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/8bf703c2-3b28-41a6-9aeb-d6a8b99305b9)

- возникшая ошибка - точнее 2 ошибки были в том, что нет standart-v4, используем актуальный standard-v1, так же количество ядер - 1 меняем на 2 согласно документации по standard-v1
- preemptible = true - это значит создать прерываюмую ВМ, которая работает не более 24 часов и может быть остановлена в любой момент
- core_fraction - производительность ядра в процентах (Гарантированная доля vCPU, которая будет выделена ВМ. ВМ с гарантированной долей меньше 100% обеспечивают указанный уровень производительности с вероятностью временного повышения вплоть до 100%. Такие ВМ подходят для задач, которые не требуют постоянной гарантии производительности vCPU на 100%. Подойдёт для обучения, уменьшение затрат на ВМ.)

# Задание 2

    Изучите файлы проекта.
    Замените все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name.
    Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf.
    Проверьте terraform plan. Изменений быть не должно.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/4f6f9cae-68de-4825-b179-eb7fbbbeced3)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/264039f4-3d8d-47a3-807a-98a96db2dc0b)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/f8ddfca4-de7a-4426-91f2-840f236763c5)

# Задание 3

    Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
    Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: "netology-develop-platform-db" , cores = 2, memory = 2, core_fraction = 20. Объявите её переменные с префиксом vm_db_ в том же файле ('vms_platform.tf').
    Примените изменения.

# Ответ 3
Выкинул в файлик
    
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/5f382dde-ad88-4e2d-b077-55ba9cc54179)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/f7e24483-fca1-4958-af12-a18af64cc6b3)

Добавил ВМ db

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/7e4fa993-4427-45b6-91e7-945e4de598b1)

Итог

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/0b90166e-a56c-4759-b8dc-89bc93d5c1da)


# Задание 4

    Объявите в файле outputs.tf output типа map, содержащий { instance_name = external_ip } для каждой из ВМ.
    Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды terraform output.

# Ответ 4

        output "VMS" {
         value = {
           instance_name = yandex_compute_instance.platform.name
           external_ip  =  yandex_compute_instance.platform.network_interface.0.nat_ip_address
           instance_name2 = yandex_compute_instance.platform2.name
           external_ip2 =  yandex_compute_instance.platform2.network_interface.0.nat_ip_address
           }
        }

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/b3d380a2-6b63-4aef-baeb-9fb679027db5)

# Задание 5

    В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с несколькими переменными по примеру из лекции.
    Замените переменные с именами ВМ из файла variables.tf на созданные вами local-переменные.
    Примените изменения.

# Ответ 5

locals.tf

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/84b812c8-f0b3-4f43-9489-c3a176711a84)

main.tf

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/9637c8be-10cc-4c16-9e34-5bdfad700b60)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/76208641-a767-4228-ad10-6c10c5a84c3c)

variables.tf

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/63e03b31-570e-44af-9528-345e1957f5e3)

Применил 

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/2ab32da1-6df5-4d0f-ad6d-5369405a2e3e)

# Задание 6

    Вместо использования трёх переменных ".._cores",".._memory",".._core_fraction" в блоке resources {...}, объедините их в переменные типа map с именами "vm_web_resources" и "vm_db_resources". В качестве продвинутой практики попробуйте создать одну map-переменную vms_resources и уже внутри неё конфиги обеих ВМ — вложенный map.
    Также поступите с блоком metadata {serial-port-enable, ssh-keys}, эта переменная должна быть общая для всех ваших ВМ.
    Найдите и удалите все более не используемые переменные проекта.
    Проверьте terraform plan. Изменений быть не должно.

# Ответ 6

первая вм


вторая вм













