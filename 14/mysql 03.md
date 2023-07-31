# Задача 1

Используя Docker, поднимите инстанс MySQL (версию 8). Данные БД сохраните в volume.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/0cfd1d1e-8fd6-445e-8aba-cd8e63dd321a)

Изучите бэкап БД и восстановитесь из него.

 - копируем в контейнер

 ![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/2630b1ad-1fdc-48a7-8d0f-88db4211ce8e)

 - восстанонавливаем
 
  ![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/380c8dc3-eb2d-46f8-afa0-7c0da23e26af)

Перейдите в управляющую консоль mysql внутри контейнера.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/2076ff71-572a-4f32-a81b-05c2c0b57d15)

Используя команду \h, получите список управляющих команд.
Найдите команду для выдачи статуса БД и приведите в ответе из её вывода версию сервера БД.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/7de68d00-cd3f-4892-90c3-bc90c6b9ea39)

Подключитесь к восстановленной БД и получите список таблиц из этой БД.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/916e45b6-b4a3-4495-9301-32246879083a)

Приведите в ответе количество записей с price > 300.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/f75f774d-e5e2-4975-8654-f4b8a0f5a526)

# Задача 2

Создайте пользователя test в БД c паролем test-pass, используя:

    плагин авторизации mysql_native_password
    срок истечения пароля — 180 дней
    количество попыток авторизации — 3
    максимальное количество запросов в час — 100
    аттрибуты пользователя:
        Фамилия "Pretty"
        Имя "James".

Предоставьте привелегии пользователю test на операции SELECT базы test_db.

Используя таблицу INFORMATION_SCHEMA.USER_ATTRIBUTES, получите данные по пользователю test и приведите в ответе к задаче.

----
Создайте пользователя

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/1cc2ddbe-f692-422b-8961-46f784d9e319)

привелегии пользователю test на операции SELECT базы test_db

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/c577fd50-27e1-4af7-a22c-b2a4a55bcfb4)

данные по пользователю test

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/3cb17b75-25d3-42b6-90c9-93df66e5cd14)

# Задача 3

Установите профилирование SET profiling = 1. Изучите вывод профилирования команд SHOW PROFILES;.

Исследуйте, какой engine используется в таблице БД test_db и приведите в ответе.

Измените engine и приведите время выполнения и запрос на изменения из профайлера в ответе:

    на MyISAM,
    на InnoDB.

----

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/47eedfbd-3bc5-4f55-b577-b644eb129f87)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/bad231f5-748c-4195-bee4-2f1c0aa31afa)

# Задача 4

Изучите файл my.cnf в директории /etc/mysql.

Измените его согласно ТЗ (движок InnoDB):

    скорость IO важнее сохранности данных;
    нужна компрессия таблиц для экономии места на диске;
    размер буффера с незакомиченными транзакциями 1 Мб;
    буффер кеширования 30% от ОЗУ;
    размер файла логов операций 100 Мб.

Приведите в ответе изменённый файл my.cnf.

-----

исходный

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/7a601394-d824-484b-9f3f-b7bfe8e7fa86)

скорректирован

    # For advice on how to change settings please see
    # http://dev.mysql.com/doc/refman/8.0/en/server-configuration-defaults.html
    
    [mysqld]
    #
    # Remove leading # and set to the amount of RAM for the most important data
    # cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%.
    # innodb_buffer_pool_size = 128M
    #
    # Remove leading # to turn on a very important data integrity option: logging
    # changes to the binary log between backups.
    # log_bin
    #
    # Remove leading # to set options mainly useful for reporting servers.
    # The server defaults are faster for transactions and fast SELECTs.
    # Adjust sizes as needed, experiment to find the optimal values.
    # join_buffer_size = 128M
    # sort_buffer_size = 2M
    # read_rnd_buffer_size = 2M
    
    # Remove leading # to revert to previous value for default_authentication_plugin,
    # this will increase compatibility with older clients. For background, see:
    # https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_default_authentication_plugin
    # default-authentication-plugin=mysql_native_password
    skip-host-cache
    skip-name-resolve
    datadir=/var/lib/mysql
    socket=/var/run/mysqld/mysqld.sock
    secure-file-priv=/var/lib/mysql-files
    user=mysql

    innodb_flush_log_at_trx_commit = 0
    innodb_file_per_table = ON
    innodb_buffer_pool_size =  2G
    innodb_log_buffer_size = 1M
    innodb_file_format = Barracuda
    innodb_log_file_size = 100M
    
    
    pid-file=/var/run/mysqld/mysqld.pid
    [client]
    socket=/var/run/mysqld/mysqld.sock
    
    !includedir /etc/mysql/conf.d/
















