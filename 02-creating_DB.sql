USE sakila;

CREATE TABLE person
(person_id SMALLINT UNSIGNED AUTO_INCREMENT,
fname VARCHAR(20),
lname VARCHAR(20),
eye_color ENUM('BL', 'BR', 'GR'),
birth_date DATE,
street VARCHAR(30),
city VARCHAR(20),
state VARCHAR(20),
country VARCHAR(20),
postal_code VARCHAR(20),
CONSTRAINT pk_person PRIMARY KEY (person_id)
);

CREATE TABLE favorite_food
(person_id SMALLINT UNSIGNED,
food VARCHAR(20),
CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),
CONSTRAINT fk_fav_food_person_id FOREIGN KEY (person_id)
REFERENCES person (person_id)
);

set foreign_key_checks=0;
ALTER TABLE person
  MODIFY person_id SMALLINT UNSIGNED AUTO_INCREMENT;
set foreign_key_checks=1;

INSERT INTO person
  (fname, lname, eye_color, birth_date)
  VALUES ('William', 'Turner', 'BR', '1972-05-27');

INSERT INTO favorite_food (person_id, food)
VALUES (1, 'pizza');
INSERT INTO favorite_food (person_id, food)
VALUES (1, 'cookies');
INSERT INTO favorite_food (person_id, food)
VALUES (1, 'nachos');

select food from favorite_food
order by food;

INSERT INTO person
(person_id, fname, lname, eye_color, birth_date,
  street, city, state, country, postal_code)
VALUES (null, 'Susan','Smith', 'BL', '1975-11-02',
  '23 Maple St.', 'Arlington', 'VA', 'USA', '20220');

UPDATE person
SET street = '1225 Tremont St.',
  city = 'Boston',
  state = 'MA',
  country = 'USA',
  postal_code = '02138'
WHERE person_id = 1;

SELECT * FROM person;

delete from person
where person_id = 3;

select * from favorite_food;

insert into favorite_food (person_id, food)
  values (2, 'lasagna');
  
delete from favorite_food
where person_id = 3;

update person
set birth_date = '1980-05-27'
where person_id = 1;

drop table favorite_food;
drop table person;

show tables;