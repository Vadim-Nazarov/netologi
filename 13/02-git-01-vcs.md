Домашнее задание к занятию "Системы контроля версий"
----
Задача 1. Создать и настроить репозиторий для дальнейшей работы на курсе.
----
В рамках курса вы будете писать скрипты и создавать конфигурации для различных систем, которые необходимо сохранять для будущего использования. Сначала надо создать и настроить локальный репозиторий, после чего добавить удалённый репозиторий на GitHub.

Создание репозитория и первого коммита.
----
Зарегистрируйте аккаунт на https://github.com/. Если предпочитаете другое хранилище для репозитория, можно использовать его.

Создайте публичный репозиторий, который будете использовать дальше на протяжении всего курса, желательное с названием devops-netology. Обязательно поставьте галочку Initialize this repository with a README.


![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/0c721bb5-9474-4f7f-ae19-703d9a4e471f)


Создайте авторизационный токен для клонирования репозитория.
----
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/2fdb3c7d-64f5-49ba-974e-f665bbd3bb0a)


Склонируйте репозиторий, используя протокол HTTPS (git clone ...).
----
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/3230fee8-7140-432e-8f3d-da88bb8ab6a0)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/6c18fa70-bd2d-4f7a-87fb-e483bb20af95)

5 Перейдите в каталог с клоном репозитория (cd devops-netology).
---
6 Произведите первоначальную настройку Git, указав своё настоящее имя, чтобы нам было проще общаться, и email (git config --global user.name и git config --global user.email johndoe@example.com).
---
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/13a274d3-7687-4898-859c-6eec70e3e26e)

7 Выполните команду git status и запомните результат.
---
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/c182e10a-c22d-4d89-a49c-a200d32a42a4)

8 Отредактируйте файл README.md любым удобным способом, тем самым переведя файл в состояние Modified.
---
9 Ещё раз выполните git status и продолжайте проверять вывод этой команды после каждого следующего шага.
---
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/bcf6a36e-cf1a-4c03-a8cc-4bc82f95c91f)

10 Теперь посмотрите изменения в файле README.md, выполнив команды git diff и git diff --staged.
---
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/acf157e5-1c74-428a-9adc-b54dfd1c5fb8)

11 Переведите файл в состояние staged (или, как говорят, просто добавьте файл в коммит) командой git add README.md.
---
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/33a9a774-3d12-4f28-92db-b1b11c2dc872)

12 И ещё раз выполните команды git diff и git diff --staged. Поиграйте с изменениями и этими командами, чтобы чётко понять, что и когда они отображают.
---
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/06e7d9af-478e-4dcb-9708-5afa02aad0c1)

13 Теперь можно сделать коммит git commit -m 'First commit'.
---
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/3d98d527-801e-4baa-9a48-e120c98d8518)

14 И ещё раз посмотреть выводы команд git status, git diff и git diff --staged.
---
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/5bf30c04-8a44-41c0-ac70-df670b298763)


-----------


Создание файлов .gitignore и второго коммита.
---

1 Создайте файл .gitignore (обратите внимание на точку в начале файла), проверьте его статус сразу после создания.
2 Добавьте файл .gitignore в следующий коммит (git add...).
3 На одном из следующих блоков вы будете изучать Terraform, давайте сразу создадим соотвествующий каталог terraform и внутри этого каталога — файл .gitignore по примеру: https://github.com/github/gitignore/blob/master/Terraform.gitignore.
4 В файле README.md опишите своими словами, какие файлы будут проигнорированы в будущем благодаря добавленному .gitignore.
5 Закоммитьте все новые и изменённые файлы. Комментарий к коммиту должен быть Added gitignore.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/887d39c9-3f9b-46a6-b140-35d848a534a6)


---------
Эксперимент с удалением и перемещением файлов (третий и четвёртый коммит).
---
Создайте файлы will_be_deleted.txt (с текстом will_be_deleted) и will_be_moved.txt (с текстом will_be_moved) и закоммите их с комментарием Prepare to delete and move

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/b272c5aa-c68e-4513-a3ce-c7d95d976c35)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/36a94f57-c68e-4e03-ac26-3d39c5449b36)


В случае необходимости обратитесь к официальной документации — здесь подробно описано, как выполнить следующие шаги.
---
Удалите файл will_be_deleted.txt с диска и из репозитория.
---

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/0fbc1d3c-ab1f-4a19-9ed9-470cbe308a41)

Переименуйте (переместите) файл will_be_moved.txt на диске и в репозитории, чтобы он стал называться has_been_moved.txt.
---
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/d12d4a26-64f3-4b07-bf63-a05ae8b9940e)

Отправка изменений в репозиторий
---
![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/411f15b8-6f24-407b-93ce-ce45e85bd699)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/73fee78c-f3bc-40d8-b4af-4e83713bef0f)













