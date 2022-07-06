# Задание 1 -  Что происходит с оперативной памятью во время перехода ПК в:
сон (suspend) - запущенные приложения остаются в памяти пк и продолжают работать при этом в процессе ожидания

гибернацию (hibernate) - при переходе в режим гибернации приложения выгружаются из озу в отдельный файл на жестком диске, пк выключается, при запуске приложения будут восстановлены из файла.

# Задание 2 -  Как называется эта команда? Что такое si и so в примере на картинке? 

команда vmstat , si - сколько памяти было перемещено из свопа в реальную память, so - сколько памяти было перемещено из реальной в своп.

# Задание 3 - Приведите 3 команды, которые выведут на экран следующее:

Архитектуру ПК     lscpu | grep -i 'architecture'

![image](https://user-images.githubusercontent.com/107613708/177566480-d7c20c25-3575-4fd4-9ce5-743651ec6c91.png)

Модель процессора lscpu | grep -i 'model namecpu'

![image](https://user-images.githubusercontent.com/107613708/177566747-55798786-db53-4b04-be5c-7d792b90d9b5.png)


Количество памяти, которая уже не используется процессами, но еще остается в памяти(ключевое слово - inactive).  vmstat -s | grep 'inactive'

![image](https://user-images.githubusercontent.com/107613708/177566925-926e5f6f-9695-4ed4-81c4-ab4d9806ddf8.png)


# Задание 4
![image](https://user-images.githubusercontent.com/107613708/177567431-618340ca-715a-4772-bf0e-06af76f3f7df.png)

![image](https://user-images.githubusercontent.com/107613708/177575728-f88106ff-7d46-45ac-82e9-95f4b5b875d7.png)

![image](https://user-images.githubusercontent.com/107613708/177576165-57e127b2-49d9-46d9-8ac8-739283789312.png)

![image](https://user-images.githubusercontent.com/107613708/177576623-63ed1342-73df-4965-96c7-187f5cd887a7.png)

