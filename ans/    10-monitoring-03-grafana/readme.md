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

- CPULA

    - node_load1{instance="nodeexporter:9100"}
    - node_load5{instance="nodeexporter:9100"}
    - node_load15{instance="nodeexporter:9100"}

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/378db6c8-d1f2-4b36-b8b9-d0828c34bd92)

- количество свободной оперативной памяти
  
 node_memory_MemFree_bytes{instance="nodeexporter:9100",job="nodeexporter"}

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/d9f2813c-3ec8-4a2b-acd9-84af6a905d9b)

- количество места на файловой системе

node_filesystem_free_bytes{device="/dev/mapper/centos-root",instance="nodeexporter:9100",job="nodeexporter"}

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/dda19d5e-241b-455a-bac7-2e737b3bb2fd)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/20abc0ee-46c1-45da-b3e7-ccbb1ecefa0e)

# Задание 3

    Создайте для каждой Dashboard подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».
    В качестве решения задания приведите скриншот вашей итоговой Dashboard.

# Ответ 3

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/3cd82825-37d2-47b5-8271-d6ba8890123f)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/0e68fd26-e6e4-410f-b147-a5fa76b3f7df)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/0b3460f3-661d-476b-a7c1-288c1195170f)

# Задание 4
    Сохраните ваш Dashboard.Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
    В качестве решения задания приведите листинг этого файла.




