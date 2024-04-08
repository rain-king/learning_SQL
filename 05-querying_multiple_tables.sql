use sakila;

-- cartesian product
SELECT c.first_name, c.last_name, a.address
FROM customer c JOIN address a;

-- inner joins
-- defaults to inner, but good practice is to specify which
SELECT c.first_name, c.last_name, a.address
FROM customer c JOIN address a
  ON c.address_id = a.address_id;
  
-- 'using' subclause, when both column names in 'on' are the same
select c.first_name, c.last_name, a.address
from customer c inner join address a
  using (address_id);
  
-- old ansi join syntax
SELECT c.first_name, c.last_name, a.address
FROM customer c, address a
WHERE c.address_id = a.address_id;

-- three or more tables
select c.first_name, c.last_name, ct.city
from customer c
inner join address a
  using (address_id)
inner join city ct
  using (city_id)
order by ct.city;

-- subqueries as tables
SELECT c.first_name, c.last_name, addr.address, addr.city
FROM customer c
  INNER JOIN
  (SELECT a.address_id, a.address, ct.city
   FROM address a
     INNER JOIN city ct
     ON a.city_id = ct.city_id 
   WHERE a.district = 'California'
  ) addr
  ON c.address_id = addr.address_id;

-- same result? 
select c.first_name, c.last_name, a.address, ct.city
from customer c
  inner join address a
  using (address_id)
  inner join city ct
  using (city_id)
where a.district = 'California';

-- repeating tables
select a.first_name, a.last_name, f.title
from film f
  inner join film_actor fa
  using (film_id)
  inner join actor a
  using (actor_id)
WHERE (a.first_name = 'CATE' AND a.last_name = 'MCQUEEN')
  OR (a.first_name = 'CUBA' AND a.last_name = 'BIRCH');
  
select f.title
from film f
  inner join film_actor fa1
  using (film_id)
  inner join actor a1
  on fa1.actor_id = a1.actor_id
  inner join film_actor fa2
  using (film_id)
  inner join actor a2
  on fa2.actor_id = a2.actor_id
WHERE (a1.first_name = 'CATE' AND a1.last_name = 'MCQUEEN')
  AND (a2.first_name = 'CUBA' AND a2.last_name = 'BIRCH');

-- self joins
desc film; -- suppose there is a prequel_id column
select f.title, f_prequel.title prequel
from film f
inner join film f_prequel
  on f.prequel_id = f_prequel.film_id
where f.prequel_id is not null;

-- exercise 5-1
SELECT c.first_name, c.last_name, a.address, ct.city
FROM customer c
  INNER JOIN address a
  ON c.address_id = a.address_id
  INNER JOIN city ct
  ON a.city_id = ct.city_id
WHERE a.district = 'California';

-- exercise 5-2
select f.title
from film f
  inner join film_actor fa
  using (film_id)
  inner join actor a
  using (actor_id)
where a.first_name = 'JOHN';

-- exercise 5-3
select a1.address, a2.address
from address a1
  inner join address a2
where a1.city_id = a2.city_id
  and  a1.address != a2.address;