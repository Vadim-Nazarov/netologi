# Задание 1

Вам необходимо поднять в докере и связать между собой:

    elasticsearch (hot и warm ноды);
    logstash;
    kibana;
    filebeat.

Logstash следует сконфигурировать для приёма по tcp json-сообщений.

Filebeat следует сконфигурировать для отправки логов docker вашей системы в logstash.

В директории help находится манифест docker-compose и конфигурации filebeat/logstash для быстрого выполнения этого задания.

Результатом выполнения задания должны быть:

    скриншот docker ps через 5 минут после старта всех контейнеров (их должно быть 5);
    скриншот интерфейса kibana;
    docker-compose манифест (если вы не использовали директорию help);
    ваши yml-конфигурации для стека (если вы не использовали директорию help).
----

# Ответ 1

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/e77829e1-abcb-4a1e-81c9-061fa277b168)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/6a76c31c-5a0a-4c42-8642-ad539cfb2caf)

# Задание 2

Перейдите в меню создания index-patterns в kibana и создайте несколько index-patterns из имеющихся.

Перейдите в меню просмотра логов в kibana (Discover) и самостоятельно изучите, как отображаются логи и как производить поиск по логам.

В манифесте директории help также приведенно dummy-приложение, которое генерирует рандомные события в stdout-контейнера. Эти логи должны порождать индекс logstash-* в elasticsearch. Если этого индекса нет — воспользуйтесь советами и источниками из раздела «Дополнительные ссылки» этого задания.

# Ответ 2

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/0cde384c-0597-4989-b07b-0d9b9665e1a5)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/ea0ed94a-d114-45ba-b645-f452ef8486b3)









