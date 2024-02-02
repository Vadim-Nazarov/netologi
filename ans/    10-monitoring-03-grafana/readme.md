# Задание 1

    Используя директорию help внутри этого домашнего задания, запустите связку prometheus-grafana.
    Зайдите в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.
    Подключите поднятый вами prometheus, как источник данных.
    Решение домашнего задания — скриншот веб-интерфейса grafana со списком подключенных Datasource.

# Ответ 1

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/84f956c1-4d97-4a42-9028-cf050d2ca1aa)


# Задание 2

Изучите самостоятельно ресурсы:

    PromQL tutorial for beginners and humans.
    Understanding Machine CPU usage.
    Introduction to PromQL, the Prometheus query language.

Создайте Dashboard и в ней создайте Panels:

    утилизация CPU для nodeexporter (в процентах, 100-idle);
    CPULA 1/5/15;
    количество свободной оперативной памяти;
    количество места на файловой системе.

Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.

# Ответ 2

- утилизация CPU для nodeexporter (в процентах, 100-idle) -

    100 - (avg by(instance) (irate(node_cpu_seconds_total{mode="idle"}[$__rate_interval])) * 100)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/0d01cfc9-2e8e-4a73-a036-18014d8f7c09)



  
