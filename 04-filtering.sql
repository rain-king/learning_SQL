select * from rental
where year(rental_date) = 2004;

-- between
SELECT customer_id, rental_date
FROM rental
WHERE rental_date BETWEEN '2005-06-14' AND '2005-06-16';

-- string ranges
SELECT last_name, first_name
FROM customer
WHERE last_name BETWEEN 'FA' AND 'FR';

SELECT title, rating
FROM film
WHERE rating IN ('G','PG');

-- where in subquery
select title, rating
from film
where rating in (select rating from film where title like '%PET%');

select title, rating
from film
where title like '%PET%';

-- not
SELECT title, rating
FROM film
WHERE rating NOT IN ('PG-13','R', 'NC-17');

SELECT last_name, first_name
FROM customer
WHERE left(last_name, 1) = 'Q';

select last_name, first_name
from customer
where last_name like 'Q%';

-- exercise 4-1
select payment_id, customer_id, amount, date(payment_date)
from payment
where customer_id <> 5 and (amount > 8 or date(payment_date) = '2005-08-23');

-- exercise 4-2
select payment_id, customer_id, amount, date(payment_date)
from payment
where customer_id = 5 and not (amount > 6 or date(payment_date) = '2005-06-19');

-- exercise 4-3
select * from payment
where amount in (1.98, 7.98, 9.98);

-- exercise 4-4
select * from customer
where last_name like '_A%W%';
