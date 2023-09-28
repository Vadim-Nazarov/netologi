![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/5ff1c49f-7f02-4a9e-afa4-53097f8c464b)


----
# Задание 1 

- Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/d853f936-200a-4121-84b5-4dfa2040c13d)

- Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?

  ![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/8b655545-1369-4395-a8b6-3c2091377439)

  personal.auto.tfvars - позволяет сохранять личную, секретную информацию
  
- Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/359f8381-2860-43c2-8e8f-2066a4db5083)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/f9246769-48a3-498b-ad9a-d16832609fb8)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/025360b6-df0c-409c-8d15-d223b92d6976)

- Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.
  
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/fd281233-26f2-4b83-9f80-c4c1dfe8f593)

первая ошибка - небыло имени

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/4df33aae-ea01-427d-bb3d-6e6d89e8fd81)

вторая ошибка -  имя а именно 1nginx - должно начинаться с буквы или подчеркивания при этом может содержать только буквы, цифры, подчеркивания и тире - перетименовываем!

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/20af706c-1c3a-49d0-9d2f-2b54bd6d2228)

тертья ошибка - верно будет random_password.random_string.result

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/e2feaf53-426e-41a3-a054-70ec3c616ac3)

правим - получаем:

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/64182dec-fdef-4b29-bdf2-04f6eaad3807)

- Выполните код. В качестве ответа приложите вывод команды docker ps

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/c529df93-267d-4966-bbf2-92877b03bb24)

- Замените имя docker-контейнера в блоке кода на hello_world. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду terraform apply -auto-approve. Объясните своими словами, в чём может быть опасность применения ключа -auto-approve. В качестве ответа дополнительно приложите вывод команды docker ps.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/dc15e48e-5027-4ee4-8590-6ace43dac2e4)

apply -auto-approve  пропускает интерактивное утверждение плана перед применением

- Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/a3f09f6e-f586-4d29-8d6a-8c254c59524c)

- Объясните, почему при этом не был удалён docker-образ nginx:latest. Ответ обязательно подкрепите строчкой из документации terraform провайдера docker. (ищите в классификаторе resource docker_image )

Keep_locally - (Необязательно, логическое значение) Если true, то образ Docker не будет удален при операции уничтожения. Если это ложь, он удалит изображение из локального хранилища докера при операции уничтожения.









