## Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Создать бакет в Object Storage с произвольным именем (например, _имя_студента_дата_).
 - Положить в бакет файл с картинкой.
 - Сделать файл доступным из интернета.
 
2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать `image_id = fd827b91d99psvq5fjit`.
 - Для создания стартовой веб-страницы рекомендуется использовать раздел `user_data` в [meta_data](https://cloud.yandex.ru/docs/compute/concepts/vm-metadata).
 - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
 - Настроить проверку состояния ВМ.
 
3. Подключить группу к сетевому балансировщику:

 - Создать сетевой балансировщик.
 - Проверить работоспособность, удалив одну или несколько ВМ.
4. (дополнительно)* Создать Application Load Balancer с использованием Instance group и проверкой состояния.

## Ответ 1

[Терраформ файлы](https://github.com/Vadim-Nazarov/netologi/tree/main/clopro-2/terraform%20files)

Терраформ отработал

![изображение](https://github.com/user-attachments/assets/de21a151-445d-4e5a-8f49-be66da187754)

YandexCloud

![изображение](https://github.com/user-attachments/assets/18022cc9-216d-45e9-99f9-fe06890d45f4)

![изображение](https://github.com/user-attachments/assets/436d9e6d-1afa-47c0-8f0d-2177eab8232b)

![изображение](https://github.com/user-attachments/assets/0762deb8-0d6b-473b-b818-6f070eb82084)

![изображение](https://github.com/user-attachments/assets/b6d6f963-745d-4509-92f9-68ca22b5e747)

![изображение](https://github.com/user-attachments/assets/4d6c3c7a-0603-4235-ae6b-7d7d9409d652)

![изображение](https://github.com/user-attachments/assets/0c651c63-01ad-4c99-8783-bd5e1837faf4)

![изображение](https://github.com/user-attachments/assets/b73c1884-3ad7-4491-b866-30faf378c25e)

Удаляем 2 ВМ 

![изображение](https://github.com/user-attachments/assets/a618229a-977e-4920-b495-70fd943756fc)

![изображение](https://github.com/user-attachments/assets/86b23dd4-5ca7-4afc-9b4a-25cc51dd8415)









