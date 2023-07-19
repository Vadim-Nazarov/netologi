
Создадим аккаунт в GitLab, если у вас его ещё нет:
--
1 GitLab. Для регистрации можно использовать аккаунт Google, GitHub и другие.

2 После регистрации или авторизации в GitLab создайте новый проект, нажав на ссылку Create a projet. Желательно назвать также, как и в GitHub — devops-netology и visibility level, выбрать Public.

3 Галочку Initialize repository with a README лучше не ставить, чтобы не пришлось разрешать конфликты.

4 Если вы зарегистрировались при помощи аккаунта в другой системе и не указали пароль, то увидите сообщение: You won't be able to pull or push project code via HTTPS until you set a password on your account. Тогда перейдите по ссылке из этого сообщения и задайте пароль. Если вы уже умеете пользоваться SSH-ключами, то воспользуйтесь этой возможностью (подробнее про SSH мы поговорим в следующем учебном блоке).

5 Перейдите на страницу созданного вами репозитория, URL будет примерно такой: https://gitlab.com/YOUR_LOGIN/devops-netology. Изучите предлагаемые варианты для начала работы в репозитории в секции Command line instructions.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/55f3e7c0-72c7-4c4d-964d-da8bd665313a)

6 Запомните вывод команды git remote -v

7 Из-за того, что это будет наш дополнительный репозиторий, ни один вариант из перечисленных в инструкции (на странице вновь созданного репозитория) нам не подходит. Поэтому добавляем этот репозиторий, как дополнительный remote, к созданному репозиторию в рамках предыдущего домашнего задания: git remote add gitlab https://gitlab.com/YOUR_LOGIN/devops-netology.git

8 Отправьте изменения в новый удалённый репозиторий git push -u gitlab main

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/19fd4ac2-0325-4e44-b8f5-7ba52ec52a6f)

9 Обратите внимание, как изменился результат работы команды git remote -v

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/023edcf2-940f-48e3-9926-eee33a4a0af5)

Видимо из за того что зарегался как "для себя" не дает сделать паблик, по необходимости если потредуется в дльнейших заданиях перерегаю на риал версию компани

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/c397af07-6ec6-4acc-8fa2-e5938aca9550)

Задание 2. Теги
---
1 Создайте легковестный тег v0.0 на HEAD-коммите и запуште его во все три добавленных на предыдущем этапе upstream.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/a966b1f4-114e-47a2-b897-70b53ca45dd1)

2 Аналогично создайте аннотированный тег v0.1.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/4993fc2c-2145-413a-a180-e1d62c0cb29d)

3 Перейдите на страницу просмотра тегов в GitHab (и в других репозиториях) и посмотрите, чем отличаются созданные теги. 

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/0fae4d53-0d1c-4fd5-9775-b33cc68e86a6)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/3005cb1f-4f4a-4404-8486-3b0ffd8b84d5)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/e7601c82-1b45-46d1-9abb-72a74a4d7cfa)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/06f15241-9cbb-4d1a-9388-5b7d69946a51)

Задание 3. Ветки
---
Давайте посмотрим, как будет выглядеть история коммитов при создании веток.

1 Переключитесь обратно на ветку main, которая должна быть связана с веткой main репозитория на github

2 Посмотрите лог коммитов и найдите хеш коммита с названием Prepare to delete and move, который был создан в пределах предыдущего домашнего задания.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/f67314fc-257b-4f46-bea5-59d583e494b7)

3 Выполните git checkout по хешу найденного коммита.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/0ea64a00-1855-40a6-841a-744c08a72ca7)

4 Создайте новую ветку fix, базируясь на этом коммите git switch -c fix.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/20450da3-64c0-4b71-971d-2445ded4877e)

5 Отправьте новую ветку в репозиторий на GitHub git push -u origin fix.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/d7b0996f-8b11-4839-82fc-63450872af08)

6 Посмотрите, как визуально выглядит ваша схема коммитов

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/06a2f616-120f-490c-9858-d67b53155307)

7 Теперь измените содержание файла README.md, добавив новую строчку

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/2a5ea843-7dd0-4f28-9d17-95961cb3da6c)

8 Отправьте изменения в репозиторий и посмотрите, как изменится схема на странице https://github.com/YOUR_ACCOUNT/devops-netology/network и как изменится вывод команды git log.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/96e0be7a-21c9-4304-97df-113a2d336dba)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/287c6520-bc6f-4aed-8399-a3f675b8411c)

Задание 4. Упрощаем себе жизнь
---

Попробуем поработь с Git при помощи визуального редактора.

1 В используемой IDE PyCharm откройте визуальный редактор работы с Git, находящийся в меню View -> Tool Windows -> Git.

2 Измените какой-нибудь файл, и он сразу появится на вкладке Local Changes, отсюда можно выполнить коммит, нажав на кнопку внизу этого диалога.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/90e1bef2-1494-48ac-a168-9befcb3e7fff)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/6671b37e-5312-4d4b-96b3-61f199611706)




























    
