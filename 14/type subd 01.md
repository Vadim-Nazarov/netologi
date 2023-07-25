Домашнее задание к занятию 1. «Типы и структура СУБД»
----
# Задача 1

рхитектор ПО решил проконсультироваться у вас, какой тип БД лучше выбрать для хранения определённых данных.

Он вам предоставил следующие типы сущностей, которые нужно будет хранить в БД:

    электронные чеки в json-виде,
    склады и автомобильные дороги для логистической компании,
    генеалогические деревья,
    кэш идентификаторов клиентов с ограниченным временем жизни для движка аутенфикации,
    отношения клиент-покупка для интернет-магазина.

Выберите подходящие типы СУБД для каждой сущности и объясните свой выбор.

-----

- Электронные чеки в json виде - MongoDB , позволяет хранить документы в json
- Склады и автомобильные дороги для логистической компании - предполагается  графовая система, тк цель бд оптимизировать путь от искодной до конечной точки
- Генеалогические деревья - наиболее подходящим станет Caché - является иерархической БД
- Кэш идентификаторов клиентов с ограниченным временем жизни для движка аутенфикации - Redis - является БД вида ключ-значение, так же используется для кэш-системы
- Отношения клиент-покупка для интернет-магазина - реляционная БД - к примеру Postgres , является табличным решением и может расширяться


# Задача 2

Вы создали распределённое высоконагруженное приложение и хотите классифицировать его согласно CAP-теореме. Какой классификации по CAP-теореме соответствует ваша система, если (каждый пункт — это отдельная реализация вашей системы и для каждого пункта нужно привести классификацию):

    данные записываются на все узлы с задержкой до часа (асинхронная запись);
    при сетевых сбоях система может разделиться на 2 раздельных кластера;
    система может не прислать корректный ответ или сбросить соединение.

Согласно PACELC-теореме как бы вы классифицировали эти реализации?

-----

- данные записываются на все узлы с задержкой до часа (асинхронная запись) - АР  и  PA/EL
- при сетевых сбоях система может разделиться на 2 раздельных кластера - СA  и EL/PC
- система может не прислать корректный ответ или сбросить соединение - CP  и PA/EC

# Задача 3

Могут ли в одной системе сочетаться принципы BASE и ACID? Почему?

- Нет не могут, принципы противоречат друг другу. ACID  - это атомарность, согласованность, изолированность и стойкость к низкоуровнемым проблемам, гарантирует надежность системы. BASE в свою очередь гарантирует только базовую доступность только в конечном итоге даёт согласованность данных, тес самым позволяет создавать высоконагруженные системы.

# Задача 4

Вам дали задачу написать системное решение, основой которого бы послужили:

    фиксация некоторых значений с временем жизни,
    реакция на истечение таймаута.

Вы слышали о key-value-хранилище, которое имеет механизм Pub/Sub. Что это за система? Какие минусы выбора этой системы?

----

Предполагаю такой ответ после доработки :

Redis - это СУБД типа key-value, которая может использоваться для реализации кэшей, брокеров сообщений (механизм pub/sub)

Минусы Redis:

- Требуютсядостаточные ресурсы RAM 
- Отсутсвие поддержки языка SQL, т.е. проблема оперативного поиска данных  
- При отказе сервера все данные с последней синхронизации с диском будут утеряны

может что то не учитываю , в таком случае прошу разьяснить в чем именно неверен мой ответ




