# Задание 1.
![изображение](https://user-images.githubusercontent.com/107613708/189876934-d29e91c1-e463-44ec-8910-d2647c618c8c.png)


# Задание 2.
ESTABLISHED, Соединение установлено - идёт передача данных.

# Задание 3.
нет
SYN - начинает соединение, FIN заканчивает. Одним пакетом нельзя одновременно и открыть и закрыть соединение 

# Задание 4.
значение UNCONN - соединение не установлено, может быть значение ESTAB - когда соединение установлено

по поводу TIME-WAIT : утилите указан параметр -u ,  те вывод UDP соединения , оно не использует предварительные пакеты, таким образом не нужно ничего ждать

# Задание 5.
Да при частом соединении и отсоединении - при каждой сессии выделяется порт, старая сессия может не закрыться а новая уже открыться, следовательно порт опять выделится новый,
не исключена ситуация что порты могут закончиться если соединения идут к одной и той же службе

# Задание 6.
 тк логи важная информация в решении проблем, то выбор TCP с гарантией доставки пакетов

# Задание 7.
![изображение](https://user-images.githubusercontent.com/107613708/189883013-0d66259c-8734-409c-bc14-349224c39c7d.png)