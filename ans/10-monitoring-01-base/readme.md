# Вопрос 1
Вас пригласили настроить мониторинг на проект. На онбординге вам рассказали, что проект представляет из себя платформу для вычислений с выдачей текстовых отчетов, которые сохраняются на диск. Взаимодействие с платформой осуществляется по протоколу http. Также вам отметили, что вычисления загружают ЦПУ. Какой минимальный набор метрик вы выведите в мониторинг и почему?

Ответ:
- 1 - однозначно загрузку ЦПУ и обьем свободного места - это критически важные параметры в лучае чего требующие апргрейда со стороны железной части
- 2 - метрику по процессам - какие процессы испо льзуют ЦПУ и в каком обьеме - а так же и ОЗУ
- 3 - отдельню метрику на скорость чтерия/записи диска - для выявления проблем с диском
На основе этих метрик можно делать выводы о состоянии железной части и в случае нехватки - его апгрейда, а в случае избытка  - использование его под еще какие то задачи

# Вопрос 2
Менеджер продукта посмотрев на ваши метрики сказал, что ему непонятно что такое RAM/inodes/CPUla. Также он сказал, что хочет понимать, насколько мы выполняем свои обязанности перед клиентами и какое качество обслуживания. Что вы можете ему предложить?

Ответ:
Можно вывести вестики в визуальном виде - например Grafana и показывать в виде дашбордов. Так же необходимо будет объяснить такие понятия SLA (соглашение об уровне обслуживания) в рамках которого будут указаны SLO (целевой уровень качества обслуживания) для тех или иных метрик. Далее настроить согласованные для SLO метрики и также выводить их на дашборды с возможностью выбора времени.

# Вопрос 3
Вашей DevOps команде в этом году не выделили финансирование на построение системы сбора логов. Разработчики в свою очередь хотят видеть все ошибки, которые выдают их приложения. Какое решение вы можете предпринять в этой ситуации, чтобы разработчики получали ошибки приложения?

Ответ:
- 1 - Вариант использовать бесплатное ПО - например Yandex Cloud Logging, Sentry
- 2 - Написать собственный скрипт для сбора логов

# Вопрос 4
Вы, как опытный SRE, сделали мониторинг, куда вывели отображения выполнения SLA=99% по http кодам ответов. Вычисляете этот параметр по следующей формуле: summ_2xx_requests/summ_all_requests. Данный параметр не поднимается выше 70%, но при этом в вашей системе нет кодов ответа 5xx и 4xx. Где у вас ошибка?

Ответ:

  Необходимо добавить коды 1хх и 3хх
 
  Формула должна выглядеть следующим образом т.к. SLA должна быть на одном уровне с SLI
 
  (summ_1xx_requests + summ_2xx_requests + summ_3xx_requests)/summ_all_requests**

# Вопрос 5
Опишите основные плюсы и минусы pull и push систем мониторинга.

Ответ:

Push система мониторинга

Плюсы

- можно указать несколько точек отправки для репликации метрик
- более гибкая настройка отправки пакетов данных с метриками между агентами
- UDP — это менее затратный способ передачи данных, из-за чего может возрасти производительность сбора метрик

Минусы

- настройка каждого агента отдельно

Pull система мониторинга

Плюсы

- можно централизованно задать какие агенты опрашивать
- можно настроить единый proxy до всех агентов с TLS для взаимодействия с сервером
- упрощённая отладка получения данных с агентов

Минусы

потеря данных при  при отключения сервера мониторинга или проблемах с сетью

# Вопрос 6
Какие из ниже перечисленных систем относятся к push модели, а какие к pull? А может есть гибридные?

- Prometheus - гибридная - Push с Pushgateway
- TICK - Push 
- Zabbix - гибридная - Pull с Zabbix Proxy
- VictoriaMetrics - зависит от источника Push - Pull
- Nagios - Pull

# Вопрос 7

Склонируйте себе репозиторий и запустите TICK-стэк, используя технологии docker и docker-compose.
В виде решения на это упражнение приведите скриншот веб-интерфейса ПО chronograf (http://localhost:8888).
P.S.: если при запуске некоторые контейнеры будут падать с ошибкой - проставьте им режим Z, например ./data:/var/lib:Z

Ответ:

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/475654f3-0b20-4511-87cd-a6bb0828e7bf)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/da3fb733-5c73-409b-9afc-f7485d055ce8)


# Вопрос 8

Перейдите в веб-интерфейс Chronograf (http://localhost:8888) и откройте вкладку Data explorer.
        Нажмите на кнопку Add a query
        Изучите вывод интерфейса и выберите БД telegraf.autogen
        В measurments выберите cpu->host->telegraf-getting-started, а в fields выберите usage_system. Внизу появится график утилизации cpu.
        Вверху вы можете увидеть запрос, аналогичный SQL-синтаксису. Поэкспериментируйте с запросом, попробуйте изменить группировку и интервал наблюдений.

Для выполнения задания приведите скриншот с отображением метрик утилизации cpu из веб-интерфейса.

Ответ :

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/36f03959-927a-4f4b-9bf6-3c46ea9e710a)

# Вопрос 9

Изучите список telegraf inputs. Добавьте в конфигурацию telegraf следующий плагин - docker:

[[inputs.docker]]
  endpoint = "unix:///var/run/docker.sock"

Дополнительно вам может потребоваться донастройка контейнера telegraf в docker-compose.yml дополнительного volume и режима privileged:

  telegraf:
    image: telegraf:1.4.0
    privileged: true
    volumes:
      - ./etc/telegraf.conf:/etc/telegraf/telegraf.conf:Z
      - /var/run/docker.sock:/var/run/docker.sock:Z
    links:
      - influxdb
    ports:
      - "8092:8092/udp"
      - "8094:8094"
      - "8125:8125/udp"

После настройке перезапустите telegraf, обновите веб интерфейс и приведите скриншотом список measurments в веб-интерфейсе базы telegraf.autogen . Там должны появиться метрики, связанные с docker.

Ответ: Плагин уже встроен в последней версии sandbox, неодходимо только добавить одну строчку -  user: telegraf:120

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/af2f32ec-9d1e-4e14-abed-66a759b9eed0)

