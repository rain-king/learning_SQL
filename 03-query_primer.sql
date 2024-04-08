use sakila;

select first_name, last_name
from customer
where last_name = 'ZIEGLER';

select *
from category;

select language_id, name
from language;

select version(), user(), database();

select * from film_actor
order by film_id;

select * from actor;

-- subquery
select concat(cust.last_name, ', ', cust.first_name) full_name
from (select first_name, last_name
  from customer 
  where first_name = 'JESSIE'
  ) cust;

-- inner join     
SELECT customer.first_name, customer.last_name,
  time(rental.rental_date) rental_time
FROM customer
  INNER JOIN rental
  ON customer.customer_id = rental.customer_id
WHERE date(rental.rental_date) = '2005-06-14';

-- with aliases
SELECT c.first_name, c.last_name,
time(r.rental_date) rental_time
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14';

show tables;

select * from address;

-- join address
select c.customer_id, c.first_name, c.last_name,
  a.address, a.phone
from customer c
  inner join address a
  on a.address_id = c.address_id
where first_name like 'M%'
  or first_name like 'C%';
  
-- group and having
SELECT c.first_name, c.last_name, count(*)
FROM customer c
  INNER JOIN rental r
  ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name
HAVING count(*) >= 40;

-- order_by desc
SELECT c.first_name, c.last_name,
  time(r.rental_date) rental_time
FROM customer c
  INNER JOIN rental r
  ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY time(r.rental_date) desc;

-- exercise 3-1
select actor_id, first_name, last_name
from actor
order by last_name, first_name;

-- exercise 3-2
select actor_id, first_name, last_name
from actor
where last_name = 'WILLIAMS' or last_name = 'DAVIS';

-- exercise 3-3
select customer_id
from rental
where date(rental_date) = '2005-07-05';

-- exercise 3-4
SELECT c.email, r.return_date
FROM customer c
  INNER JOIN rental r
  ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY r.return_date desc;
