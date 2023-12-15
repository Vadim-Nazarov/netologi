# Домашнее  работа по заданию  «Жизненный цикл ПО»
----

Подготовка к выполнению

    Получить бесплатную версию Jira - https://www.atlassian.com/ru/software/jira/work-management/free (скопируйте ссылку в адресную строку). Вы можете воспользоваться любым(в том числе бесплатным vpn сервисом) если сайт у вас недоступен. Кроме того вы можете скачать docker образ и запустить на своем хосте self-managed версию jira.
    Настроить её для своей команды разработки.
    Создать доски Kanban и Scrum.
    Дополнительные инструкции от разработчика Jira.
----

# Ответ:
Сделано 
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/5191d50c-25e8-4818-bc4d-bdf9ddc6fca5)

# Основная часть

Необходимо создать собственные workflow для двух типов задач: bug и остальные типы задач. Задачи типа bug должны проходить жизненный цикл:

    Open -> On reproduce.
    On reproduce -> Open, Done reproduce.
    Done reproduce -> On fix.
    On fix -> On reproduce, Done fix.
    Done fix -> On test.
    On test -> On fix, Done.
    Done -> Closed, Open.

Остальные задачи должны проходить по упрощённому workflow:

    Open -> On develop.
    On develop -> Open, Done develop.
    Done develop -> On test.
    On test -> On develop, Done.
    Done -> Closed, Open.

Что нужно сделать

    Создайте задачу с типом bug, попытайтесь провести его по всему workflow до Done.
    Создайте задачу с типом epic, к ней привяжите несколько задач с типом task, проведите их по всему workflow до Done.
    При проведении обеих задач по статусам используйте kanban.
    Верните задачи в статус Open.
    Перейдите в Scrum, запланируйте новый спринт, состоящий из задач эпика и одного бага, стартуйте спринт, проведите задачи до состояния Closed. Закройте спринт.
    Если всё отработалось в рамках ожидания — выгрузите схемы workflow для импорта в XML. Файлы с workflow и скриншоты workflow приложите к решению задания.

# Ответ

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/d63c79db-dbb8-4a88-b924-0a9ab2b7844f)


[workflow.xml](https://github.com/Vadim-Nazarov/netologi/blob/main/ans/09%20-%20jira/workflow.xml)


![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/0a5bb972-3f0a-45cb-9b3d-900a82569289)


[workflow general.xml](https://github.com/Vadim-Nazarov/netologi/blob/main/ans/09%20-%20jira/workflow%20general.xml)


