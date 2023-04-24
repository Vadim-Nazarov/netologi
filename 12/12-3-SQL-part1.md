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
    where payment_date between '2005-06-15' and '2005-06-19' and amount > 10.00
    order by payment_date desc 
    
![изображение](https://user-images.githubusercontent.com/107613708/233989893-b7e3dafb-48f3-48a4-a775-7a65864e5abb.png)

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
