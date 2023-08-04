Домашнее задание к занятию 4. «PostgreSQL»

#Задача 1

Используя Docker, поднимите инстанс PostgreSQL (версию 13). Данные БД сохраните в volume.

    version: '3'
    services:
     db:
       container_name: pg13
       image: postgres:13
       environment:
         POSTGRES_USER: vn
         POSTGRES_PASSWORD: admin1
         POSTGRES_DB: vn
       ports:
         - "5435:5435"
       volumes:
         - database_volume:/home/database/
         - backup_volume:/home/backup/
    
    volumes:
     database_volume:
     backup_volume:

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/fb62d28e-1ade-4676-b415-cb5382890f72)

Подключитесь к БД PostgreSQL, используя psql.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/7da84984-fbcb-40b6-8b20-07fc4f3da496)

Воспользуйтесь командой \? для вывода подсказки по имеющимся в psql управляющим командам.

Найдите и приведите управляющие команды для:

   - вывода списка БД
   - подключения к БД
   - вывода списка таблиц
   - вывода описания содержимого таблиц,
   - выхода из psql.


вывода списка БД

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/b85f44eb-727f-4995-96d2-c32c948ae671)

подключения к БД

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/e46ae648-9f2a-4306-bd2a-0362732ddbe7)

вывода списка таблиц

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/0d6f55d1-b73a-470d-b63a-c824acda01ba)

вывода описания содержимого таблиц

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/c8c407e4-b001-4a11-ac0e-11de0f83a453)

выхода из psql

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/857d862f-c359-4477-8e4c-dba45c01e0c6)

# Задача 2

- Используя psql, создайте БД test_database.
- Изучите бэкап БД.
- Восстановите бэкап БД в test_database.
- Перейдите в управляющую консоль psql внутри контейнера.
- Подключитесь к восстановленной БД и проведите операцию ANALYZE для сбора статистики по таблице.
- Используя таблицу pg_stats, найдите столбец таблицы orders с наибольшим средним значением размера элементов в байтах.

Приведите в ответе команду, которую вы использовали для вычисления, и полученный результат.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/82386adc-d2fd-4ab9-87ca-0aa34b67be84)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/a9676434-82f5-4fef-b1a7-d68d4963d97d)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/59d63b23-ec0c-4f65-8d72-7a7ef105aa16)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/be352fee-d511-422b-83c9-88c3bcbc6c03)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/e649b512-37a9-4712-a012-4671b331eda7)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/87d189ac-6963-45c5-8d23-bc332da8bdc9)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/ae6d807b-24da-41a1-aec4-33e229331986)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/5e78f922-e60b-479a-a857-4bfeaaac48f2)


# Задача 3

Архитектор и администратор БД выяснили, что ваша таблица orders разрослась до невиданных размеров и поиск по ней занимает долгое время. Вам как успешному выпускнику курсов DevOps в Нетологии предложили провести разбиение таблицы на 2: шардировать на orders_1 - price>499 и orders_2 - price<=499.

Предложите SQL-транзакцию для проведения этой операции.

Можно ли было изначально исключить ручное разбиение при проектировании таблицы orders?

Ответ:

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/8d5d5c4b-7ed9-4662-b28b-d3fb5542e154)

Можно:

    CREATE RULE orders_insert_to_more AS ON INSERT TO orders WHERE ( price > 499 ) DO INSTEAD INSERT INTO orders_more_499_price VALUES (NEW.*);
    CREATE RULE orders_insert_to_less AS ON INSERT TO orders WHERE ( price <= 499 ) DO INSTEAD INSERT INTO orders_less_499_price VALUES (NEW.*);


# Задача 4

Используя утилиту pg_dump, создайте бекап БД test_database.

Как бы вы доработали бэкап-файл, чтобы добавить уникальность значения столбца title для таблиц test_database?


![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/65cca57e-c40d-47cf-a203-4ce9189b7aaa)

добавить индекс или первичный ключ:

CREATE INDEX ON orders ((lower(title)));

# Добавить UNIQUE

CREATE TABLE public.orders_2 (id integer, title character varying(80) UNIQUE, price integer);












