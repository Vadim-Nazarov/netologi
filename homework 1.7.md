# Какие операции замедляют работу компьютера в многозадачных системах?
- все, как активные так и пассивные, что касается пассивных - даже если они не выполняются всеравно занимают место в оперативной памяти и таблице запущенных процесов. 

# В каких ситуациях планировщик ввода / вывода noop может быть производительней cfq?
вероятней noop будет лучше когда испеользуется умный райд контроллер, умный cfq планировщик будет более полезен когда используются традиционные системы с вращающимися дисками
