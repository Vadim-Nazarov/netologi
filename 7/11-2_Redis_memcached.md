# Задание 1:

Задание 1. Кеширование
Приведите примеры проблем, которые может решить кеширование.

# Ответ задание 1:

- Запросы к базам данных могут быть медленными и требовать серьёзных системных ресурсов, так как серверу баз данных, для формирования ответа, нужно выполнять вычисления. Если запросы повторяются, кэширование их средствами базы данных поможет уменьшить время её отклика. Кроме того, кэширование полезно в ситуациях, когда несколько компьютеров работают с одной и той же базой данных, выполняя одинаковые запросы.

- Кэширование позволяет увеличивать производительность веб-приложений за счёт использования сохранённых ранее данных, вроде ответов на сетевые запросы или результатов вычислений. Благодаря кэшу, при очередном обращении клиента за одними и теми же данными, сервер может обслуживать запросы быстрее.

- Некоторые данные могут запрашиваться несколько раз в рамках одной страницы и чтобы этого избежать, можно использовать дополнительный кэш внутри самого приложения.

- Кэшировать нужно данные, которые медленно генерируются и часто запрашиваются.


# Задание 2:

Установите и запустите memcached.
Приведите скриншот systemctl status memcached, где будет видно, что memcached запущен.

# Ответ задание 2:

![изображение](https://user-images.githubusercontent.com/107613708/230856197-c0b49f94-bd25-4f87-8b9d-8bb912239ce5.png)

# Задание 3:

Запишите в memcached несколько ключей с любыми именами и значениями, для которых выставлен TTL 5.
Приведите скриншот, на котором видно, что спустя 5 секунд ключи удалились из базы.

# Ответ задание 3:

![изображение](https://user-images.githubusercontent.com/107613708/230857534-40385b79-98ac-4d4c-844d-0bf352b8e8f4.png)

# Задание 4:
Запишите в Redis несколько ключей с любыми именами и значениями.
Через redis-cli достаньте все записанные ключи и значения из базы, приведите скриншот этой операции.

# Ответ задание 4:

![изображение](https://user-images.githubusercontent.com/107613708/230859494-0d1ec4cb-80d0-4c56-9beb-8c02dabd3d79.png)


# Задание 5:
Запишите в Redis ключ key5 со значением типа "int" равным числу 5. Увеличьте его на 5, чтобы в итоге в значении лежало число 10.
Приведите скриншот, где будут проделаны все операции и будет видно, что значение key5 стало равно 10.

# Ответ задание 5:

![изображение](https://user-images.githubusercontent.com/107613708/230860474-03b46c23-9eb2-4d83-a29c-02e7514ebda9.png)
