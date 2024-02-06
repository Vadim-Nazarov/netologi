### Основная часть
DevOps

В репозитории содержится код проекта на Python. Проект — RESTful API сервис. Ваша задача — автоматизировать сборку образа с выполнением python-скрипта:

    Образ собирается на основе centos:7.
    Python версии не ниже 3.7.
    Установлены зависимости: flask flask-jsonpify flask-restful.
    Создана директория /python_api.
    Скрипт из репозитория размещён в /python_api.
    Точка вызова: запуск скрипта.
    При комите в любую ветку должен собираться docker image с форматом имени hello:gitlab-$CI_COMMIT_SHORT_SHA . Образ должен быть выложен в Gitlab registry или yandex registry.
----
# Ответ:
Использовал гитлаб
[Ссылка на репозиторий](https://gitlab.com/devops-netology1401029/devops-netology)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/7380a6e2-0fed-4bd8-ad73-6d64ff654568)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/143637a9-037f-4273-8b2d-b6d34bec4bc9)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/ba4c1555-5ffb-4243-b1bd-d6f1d2532aee)

Лог при деплое
https://gitlab.com/devops-netology1401029/devops-netology/-/jobs/6104067170


# Product Owner

Вашему проекту нужна бизнесовая доработка: нужно поменять JSON ответа на вызов метода GET /rest/api/get_info, необходимо создать Issue в котором указать:

    Какой метод необходимо исправить.
    Текст с { "message": "Already started" } на { "message": "Running"}.
    Issue поставить label: feature.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/790e40dd-f29d-4bbe-968a-13e90a07c540)

# Developer

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/a8392463-ed85-4477-a105-16260184fbaf)

Исправленный

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/acf2a10d-8018-400e-9a60-c3268cb2b8f7)

# Tester

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/11d859f8-08a2-4e8a-aa15-fb7c4b958524)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/92fc1ffa-de9d-4096-85c1-d6469fcd9cb4)






