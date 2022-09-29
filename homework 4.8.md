# Задание 1
![изображение](https://user-images.githubusercontent.com/107613708/192951821-1d13809c-84e9-44c4-8303-94a7c859b269.png)

![изображение](https://user-images.githubusercontent.com/107613708/192951965-7dbd1b2d-04aa-4d89-a0dd-8e182542b004.png)

![изображение](https://user-images.githubusercontent.com/107613708/192952194-89cf0a43-9bad-449a-ae2e-a61700196716.png)


# Задание 2

7

# Задание 3

1. Генерируем ключ

![изображение](https://user-images.githubusercontent.com/107613708/192952646-87ce371e-36cd-47c8-a48d-2fd3a5ff55d9.png)

2. Генерируем корневой сертификат. Поля в сертификате указываем любые.

![изображение](https://user-images.githubusercontent.com/107613708/192953176-b8cb1a72-f2f5-4daf-93b3-1d43f13e8755.png)

3. Сразу же сделаем сертификат в форме crt

![изображение](https://user-images.githubusercontent.com/107613708/192953364-1e1d816f-64a4-449e-b8b2-888bb43c661f.png)

4. Далее установим сертификат в систему. Ниже пример для Ubuntu/Debian систем

![изображение](https://user-images.githubusercontent.com/107613708/192953641-f3b49c8c-21ac-415d-b069-ea86afec5b21.png)

5. Приступим к выпуску самого сертификата:

5.1. Генерируем ключи

![изображение](https://user-images.githubusercontent.com/107613708/192953801-bbf0020d-2a9c-4677-9422-2ead24765cdf.png)

5.2. На основе ключа создаем CSR

![изображение](https://user-images.githubusercontent.com/107613708/192956289-c71ae3f6-da0b-4566-be8c-5bab5992987c.png)

5.3. Подписываем CSR нашим корневым сертификатом. Тем самым создаем конечный сертификат.

![изображение](https://user-images.githubusercontent.com/107613708/192956425-bad2afe9-b511-4b5a-ab9a-d8ce04cf0265.png)

6. Проверяем валидность сертификата

![изображение](https://user-images.githubusercontent.com/107613708/192956495-a86b255b-58ca-4187-9851-29ceaec0244c.png)
