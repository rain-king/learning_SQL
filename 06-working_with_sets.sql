-- union all
SELECT 'CUST' typ, c.first_name, c.last_name
FROM customer c
UNION ALL
SELECT 'ACTR' typ, a.first_name, a.last_name
FROM actor a;

-- duplicate rows if omiting typ column
SELECT 'CUST' typ, c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION ALL
SELECT 'ACTR' typ, a.first_name, a.last_name
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';

-- no duplicates, union instead of union all
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';

-- exercise 6-1 is no code
-- exercise 6-2
select first_name, last_name
from customer
where last_name like 'L%'
union
select first_name, last_name
from actor
where last_name like 'L%';

-- exercise 6-3
select first_name, last_name
from customer
where last_name like 'L%'
union
select first_name, last_name
from actor
where last_name like 'L%'
order by last_name;