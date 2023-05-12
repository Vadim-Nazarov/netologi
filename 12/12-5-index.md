# Задание 1
Напишите запрос к учебной базе данных, который вернёт процентное отношение общего размера всех индексов к общему размеру всех таблиц.

# Ответ:

    SELECT CONCAT(ROUND((SUM(index_length))*100/(SUM(data_length+index_length)),2),'%') '% '
    FROM information_schema.TABLES 
    where TABLE_SCHEMA = 'sakila'
    
 ![изображение](https://github.com/Vadim-Nazarov/netologi/assets/107613708/40cebdb5-f3f7-46b5-b78b-82e55effcfd9)




# Задание 2
Выполните explain analyze следующего запроса:

    select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount) over (partition by c.customer_id, f.title)
    from payment p, rental r, customer c, inventory i, film f
    where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id

# Ответ:
 Проблема в том что оконная функция обрабатывает излишние таблицы а именно inventory, rental и film.
 Поскольку необходимо посчитать sum платежей на дату - обработка и присоединение этих таблиц не имеет смысла, потом данные из них не используются.
 Все необходимое есть в payment и customer, другие убираем.
 
 Оптимизированный код :
 
    select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount) over (partition by c.customer_id)
    from payment p, customer c
    where date(p.payment_date) = '2005-07-30' and p.customer_id = c.customer_id 
    
- Результат до - actual time  - 5.715 s
- Результат после - actual time  - 9 ms
 
    
