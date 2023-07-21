Задание «Ветвление, merge и rebase»
----
 Шаг 1. Предположим, что есть задача — написать скрипт, выводящий на экран параметры его запуска. Давайте посмотрим, как будет отличаться работа над этим скриптом с использованием ветвления, merge и rebase.

 Создайте в своём репозитории каталог branching и в нём два файла — merge.sh и rebase.sh — с содержимым:

    #!/bin/bash
    # display command line options
    
    count=1
    for param in "$*"; do
        echo "\$* Parameter #$count = $param"
        count=$(( $count + 1 ))
    done


Этот скрипт отображает на экране все параметры одной строкой, а не разделяет их.

 Шаг 2. Создадим коммит с описанием prepare for merge and rebase и отправим его в ветку main.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/4d1f6d2d-b9d8-4464-9acf-e1151d72e752)

Подготовка файла merge.sh
----
# Создайте ветку git-merge

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/af5e9509-c28d-416c-a978-3c1e740e1048)

# Замените в ней содержимое файла merge.sh на:

    #!/bin/bash
    # display command line options
    
    count=1
    for param in "$@"; do
        echo "\$@ Parameter #$count = $param"
        count=$(( $count + 1 ))
    done

# Создайте коммит merge: @ instead *, отправьте изменения в репозиторий.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/d80f412c-d5ac-4b9b-9d7e-b10c9dcf4c17)

Разработчик подумал и решил внести ещё одно изменение в merge.sh:

    #!/bin/bash
    # display command line options

    count=1
    while [[ -n "$1" ]]; do
        echo "Parameter #$count = $1"
        count=$(( $count + 1 ))
        shift
    done

Теперь скрипт будет отображать каждый переданный ему параметр отдельно.

# Создайте коммит merge: use shift и отправьте изменения в репозиторий.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/edde85e3-483a-4386-9b50-4f634ec7ef34)

Изменим main
---
Вернитесь в ветку main. Шаг 2. Предположим, что пока мы работали над веткой git-merge, кто-то изменил main. Для этого изменим содержимое файла rebase.sh на:

    #!/bin/bash
    # display command line options

    count=1
    for param in "$@"; do
        echo "\$@ Parameter #$count = $param"
        count=$(( $count + 1 ))
    done
    
    echo "====="

В этом случае скрипт тоже будет отображать каждый параметр в новой строке.

Подготовка файла rebase.sh
----
Предположим, что теперь другой участник нашей команды не сделал git pull либо просто хотел ответвиться не от последнего коммита в main, а от коммита, когда мы только создали два файла merge.sh и rebase.sh на первом шаге.
Для этого при помощи команды git log найдём хеш коммита prepare for merge and rebase и выполним git checkout на него так: git checkout 8baf217e80ef17ff577883fda90f6487f67bbcea (хеш будет другой). Шаг 2. Создадим ветку git-rebase, основываясь на текущем коммите. Шаг 3. И изменим содержимое файла rebase.sh на следующее, тоже починив скрипт, но немного в другом стиле:

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/34a2ecfa-6dab-4ffa-8a35-c6334936787f)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/491d9d06-b5ad-4d7b-807d-1ff190196200)

Создадим ветку git-rebase, основываясь на текущем коммите.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/f83fb2b0-c605-483f-a88d-05b4e6c111a9)

И изменим содержимое файла rebase.sh на следующее, тоже починив скрипт, но немного в другом стиле:

    #!/bin/bash
    # display command line options
    
    count=1
    for param in "$@"; do
        echo "Parameter: $param"
        count=$(( $count + 1 ))
    done
    
    echo "====="

Отправим эти изменения в ветку git-rebase с комментарием git-rebase 1

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/f8055e62-900b-4e2a-9ab6-bedae1060c4a)

И сделаем ещё один коммит git-rebase 2 с пушем, заменив echo "Parameter: $param" на echo "Next parameter: $param"

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/2a5172ab-1d9a-4ffe-8039-c4b779aa6544)

Промежуточный итог
----

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/f30a8e1d-bb45-474a-9094-ba3810bf51b2)


Merge
---
Сливаем ветку git-merge в main и отправляем изменения в репозиторий, должно получиться без конфликтов:

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/94bc6033-09a4-4952-aa0d-b09fd5a7e319)

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/b36ae4b2-e687-4fff-91bd-b334700a088a)

Rebase
---
Шаг 1. Перед мержем ветки git-rebase выполним её rebase на main. Да, мы специально создали ситуацию с конфликтами, чтобы потренироваться их решать. 

Шаг 2. Переключаемся на ветку git-rebase и выполняем git rebase -i main. В открывшемся диалоге должно быть два выполненных коммита, давайте заодно объединим их в один, указав слева от нижнего fixup

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/b06d80b2-1dde-4358-9942-16c1f22984e2)

Если посмотреть содержимое файла rebase.sh, то увидим метки, оставленные Git для решения конфликта:

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/79c0058c-fda4-4944-bc17-e78ee5ae95e3)

Шаг 3. Удалим метки, отдав предпочтение варианту: echo "\$@ Parameter #$count = $param"

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/b6a33342-bd5f-45ab-903b-9d080dc4c5ce)

Шаг 4. Сообщим Git, что конфликт решён git add rebase.sh и продолжим rebase git rebase --continue.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/0b379fac-4879-49ae-b44d-bb3d5b2b5e1f)

Шаг 5. Опять получим конфликт в файле rebase.sh при попытке применения нашего второго коммита. Давайте разрешим конфликт, оставив строчку echo "Next parameter: $param".

Шаг 6. Далее опять сообщаем Git о том, что конфликт разрешён — git add rebase.sh — и продолжим rebase — git rebase --continue.

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/1699c58f-c1df-4364-99f5-48f7bbc9f1db)

Шаг 7. И попробуем выполнить git push либо git push -u origin git-rebase, чтобы точно указать, что и куда мы хотим запушить.

Эта команда завершится с ошибкой

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/3333981c-ab45-4bb9-a64a-4c5b08345ee5)

Шаг 8. Чтобы Git позволил нам это сделать, добавим флаг force:

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/7e587a11-61a7-44d2-9cc8-471f7b9087f7)

Шаг 9. Теперь можно смержить ветку git-rebase в main без конфликтов и без дополнительного мерж-комита простой перемоткой:

![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/cf43eb5a-0184-4069-9a6d-60c3f8a2ac90)























