# Задание 1
Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию:

  -  фамилия и имя сотрудника из этого магазина;
  -  город нахождения магазина;
  -  количество пользователей, закреплённых в этом магазине.
___
    select s.first_name, s.last_name , c.city, count(c2.first_name) kolvo
    from staff s
    join address a on a.address_id = s.address_id
    join city c on c.city_id = a.city_id
    join customer c2  on c2.customer_id = c2.customer_id 
    group by  c.city, s.first_name ,s.last_name 
    having  count(c2.customer_id) > 300 ;
![изображение](https://user-images.githubusercontent.com/107613708/234797495-d27a00f8-37fa-47aa-bbff-07830245799a.png)

# Задание 2

Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.
___

    select count(`length`) film_id 
    from film f 
    where  `length` > (select avg(`length`) from film)
    
![изображение](https://user-images.githubusercontent.com/107613708/234799753-c3e1490b-6f8c-4fca-9311-d2d1ce97e768.png)



# Задание 3

Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.
___
    select month  (payment_date) m, count(rental_id) c, sum(amount) summ 
    from payment p 
    group by month  (payment_date) 
    order by sum(amount) desc 
    limit 1
![изображение](https://user-images.githubusercontent.com/107613708/234800528-c51e80e5-723f-456f-ab60-f347ebe6f066.png)
