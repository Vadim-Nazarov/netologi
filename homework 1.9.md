# Задание 1
Вопрос 1: Файл ~/test и /tmp/test_123 это один и тот же файл(одинаковые inode)?
---
Два разных файла

![изображение](https://user-images.githubusercontent.com/107613708/179921850-9ae727f5-e7e3-4936-93c6-d0f430297903.png)

Вопрос 2: Файл /tmp/soft_link и /tmp/hard_link это один и тот же файл(одинаковые inode)?
---
Разные

![изображение](https://user-images.githubusercontent.com/107613708/179923010-82542cd5-200e-4886-8026-aadb13a508f0.png)

Вопрос 3: Файл /tmp/test_123 и /tmp/hard_link это один и тот же файл(одинаковые inode)?
---
Один и тот же

![изображение](https://user-images.githubusercontent.com/107613708/179923484-646d68bf-5598-4c1e-9538-e193214112b7.png)

Вопрос 4: 
---
Собственно ответ выше в скриншотах решения задачи

# Задание 2

    Создайте файл ~/netology.
    Создайте каталог ~/netology/  данное действие невозможно выполнить!!!! В UNIX все есть файл - каталог -это тоже файл, следовательно 2 файла с одним именем в одной директории создать невозможно
    Поместите файл netology в каталог netology.
# Задание 3
- Количество inodes в определенном каталоге ls -lai /...
- Статистика Inodes sudo df -ih /
- В каких файловых системах не может возникнуть проблемы нехватки inodes? -  Btrfs - она основана принципе структур B-деревьев и копировании при записи

# Задание 4

![изображение](https://user-images.githubusercontent.com/107613708/179934237-40e13877-d50d-4b25-9a81-7084afdd167a.png)

![изображение](https://user-images.githubusercontent.com/107613708/179937838-90ebd7cd-60cd-4bd8-86e3-edb35ed6cd47.png)

![изображение](https://user-images.githubusercontent.com/107613708/179937888-df77f8b1-0ae2-4901-818c-a136c01c6641.png)
