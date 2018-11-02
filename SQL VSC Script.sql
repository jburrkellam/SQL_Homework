--###########################
--Author - Jacob Kellam

--============================
--1a
SELECT first_name, last_name
	FROM actor;
--#############################
--1b
create table combined(
	Actor_Name varchar(100) not null);
INSERT INTO combined (Actor_Name)
SELECT first_name, last_name FROM actor;

--################################
--2a
select actor_id, first_name, last_name
from actor
where first_name = "Joe"
--################################
--2b
SELECT *
FROM actor
WHERE (last_name like '%gen%');
--################################
--2c
SELECT *
FROM actor
WHERE (last_name like '%li%')
order by last_name, first_name;
--#################################
--2d
SELECT * 
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');
--##################################
--3a
alter table actor
add column description BLOB;
--###################################
--3b
ALTER TABLE actor DROP COLUMN description
--#####################################
--4a
select last_name, count(last_name)
from actor
group by last_name;
--######################################
--4b
select last_name, count(last_name)
from actor
group by last_name
having count(last_name) >2;
--########################################
--4c
select * from actor
where first_name = "GROUCHO"
update actor 
set first_name = "HARPO"
where actor_id = 172
--#########################################
--4d
select * from actor
set first_name = "GROUCHO"
where first_name = "HARPO"
--#########################################
--5
Show create table address
--#########################################
--6a
select address.address, staff.first_name, staff.last_name
from address
inner join staff on staff.address_id = address.address_id;
--#########################################
--6b
select staff.staff_id, staff.first_name, staff.last_name, sum(payment.amount) as sum_Rung_Up
from payment
inner join staff on payment.staff_id = staff.staff_id
where (payment_date like '2005-08-%')
group by staff.staff_id, staff.first_name, staff.last_name;
--#########################################
--6C
select film.title, count(film_actor.actor_id) as Film_Actor_Count
from film_actor
inner join film on film_actor.film_id = film.film_id
group by title;
--###########################################
--6d
select film.title as "Title", count(inventory.film_id) as "Copy_Count"
from inventory
join film on film.film_id = inventory.film_id
where inventory.film_id = 439;
--###########################################
--6e
select customer.first_name, customer.last_name, sum(payment.amount) as Total_Amount_Paid
from customer
inner join payment on customer.customer_id = payment.customer_id
group by customer.first_name, customer.last_name
order by last_name;
--############################################
--7a
select title
from film 
where title in 
(select title 
from film
where language_id = "1" ) and title like 'Q%' or title like 'K%';
--###############################################
--7b
select first_name, last_name
from actor
where actor.actor_id in 
(select film_actor.actor_id
from film_actor	
join film on film.film_id = film_actor.film_id
where film.film_id in 
(select film.film_id
from film
where title="Alone Trip")
);
--###############################################
--7c
select first_name, last_name, email
from customer
join address on address.address_id = customer.address_id
where address.address_id in 
(select city_id 
from city
join country on country.country_id = city.country_id
where country.country_id in 
(select country_id 
from country
where country = "Canada")
);
--################################################
--7d
select title 
from film
where film.film_id in 
(select film_category.film_id
from film_category
join film on film_category.film_id = film.film_id
where film_category.category_id in 
(select category_id
from category
where name="Family")
);
--#################################################