SELECT r.customer_id, c.first_name, c.last_name, count(*) n
FROM rental r
  inner join customer c
  using (customer_id)
GROUP BY r.customer_id
order by n desc;

-- grouping by all rows
SELECT MAX(amount) max_amt,
  MIN(amount) min_amt,
  AVG(amount) avg_amt,
  SUM(amount) tot_amt,
  COUNT(*) num_payments
FROM payment;

-- error, no explicit grouping
SELECT customer_id,
  MAX(amount) max_amt,
  MIN(amount) min_amt,
  AVG(amount) avg_amt,
  SUM(amount) tot_amt,
  COUNT(*) num_payments
FROM payment;

-- fixed
SELECT customer_id,
  MAX(amount) max_amt,
  MIN(amount) min_amt,
  AVG(amount) avg_amt,
  SUM(amount) tot_amt,
  COUNT(*) num_payments
FROM payment
group by customer_id;

-- distinct
SELECT COUNT(customer_id) num_rows,
  COUNT(DISTINCT customer_id) num_customers
FROM payment;

-- multi column grouping
SELECT fa.actor_id, f.rating, count(*)
FROM film_actor fa
  INNER JOIN film f
  ON fa.film_id = f.film_id
GROUP BY fa.actor_id, f.rating
ORDER BY 1,2;

-- grouping via expressions
select extract(year from rental_date) year,
  count(*) how_many
from rental
group by extract(year from rental_date);

-- with rollup
SELECT fa.actor_id, f.rating, count(*)
FROM film_actor fa
  INNER JOIN film f
  ON fa.film_id = f.film_id
GROUP BY fa.actor_id, f.rating with rollup
ORDER BY 1,2;

-- exercise 8-1
select count(*) from payment;

-- exercise 8-2
select customer_id, sum(amount) total_paid, count(*)
from payment
group by customer_id;

-- exercise 8-3
select customer_id, sum(amount) total_paid, count(*)
from payment
group by customer_id
having count(*) >= 40;