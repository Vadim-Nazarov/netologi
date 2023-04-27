# Задание 1
Получите уникальные названия районов из таблицы с адресами, которые начинаются на “K” и заканчиваются на “a” и не содержат пробелов.

    select distinct district 
    from	address 
    where district  like 'K%a' and district  not like '% %'

![изображение](https://user-images.githubusercontent.com/107613708/233988819-6f14c9a5-e762-4432-805d-1f6b9ede6160.png)

# Задание 2
Получите из таблицы платежей за прокат фильмов информацию по платежам, которые выполнялись в промежуток с 15 июня 2005 года по 18 июня 2005 года включительно и стоимость которых превышает 10.00.

        select payment_id, payment_date, amount
        from payment 
        where payment_date between '2005-06-15 00:00:00' and '2005-06-18 23:59:59' and amount > 10.00
        order by payment_date desc 
    
![изображение](https://user-images.githubusercontent.com/107613708/234187961-3285287b-df45-4f74-82a6-513e89af7592.png)



# Задание 3
Получите последние пять аренд фильмов.

    select rental_id, payment_id, payment_date, amount
    from	payment
    order by payment_date desc
    limit 5
    
![изображение](https://user-images.githubusercontent.com/107613708/233991448-72ca0408-c1f1-47a5-82bb-e2023fa5fb37.png)

# Задание 4
Одним запросом получите активных покупателей, имена которых Kelly или Willie.

Сформируйте вывод в результат таким образом:

- все буквы в фамилии и имени из верхнего регистра переведите в нижний регистр,
- замените буквы 'll' в именах на 'pp'.

![изображение](https://user-images.githubusercontent.com/107613708/233992289-27c92408-d040-4ac4-b2ba-572780686c15.png)

    select lower(first_name), replace (first_name, 'LL', 'pp')
    from	customer 
    where first_name = 'Kelly' or first_name = 'Willie'
    
![изображение](https://user-images.githubusercontent.com/107613708/234010365-440a0a91-a94c-4267-91e0-ac7de6e738e3.png)
    
    select lower(replace (first_name, 'LL', 'pp' )) fst, lower(replace (last_name , 'LL', 'pp' )) lnam
    from	customer 
    where first_name = 'Kelly' or first_name = 'Willie'
    
# Задание 5
Выведите Email каждого покупателя, разделив значение Email на 2 отдельных колонки: в первой колонке должно быть значение, указанное до @, во второй значение, указанное после @.


        select email, substring_index(email , '@', 1), substring_index(email , '@', -1)
        from customer;

![изображение](https://user-images.githubusercontent.com/107613708/234188427-73a1851a-53a9-4c8d-8ca5-ad67f16efd62.png)

