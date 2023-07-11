--1. How many actors are there with the last name ‘Wahlberg’?
select * from actor where last_name = 'Wahlberg';
--2. How many payments were made between $3.99 and $5.99?
select * from payment where amount BETWEEN 3.99 and 5.99;
--3. What film does the store have the most of? (search in inventory)
select inventory.film_id, title, count(*) as num
from inventory
left join film
on inventory.film_id = film.film_id
group by inventory.film_id, title
order by num desc;
--4. How many customers have the last name ‘William’?
select * from customer where last_name = 'William';
--5. What store employee (get the id) sold the most rentals?
select staff.staff_id, staff.first_name, staff.last_name, count(*) as num from rental
left join staff
on staff.staff_id = rental.staff_id 
group by staff.staff_id, staff.first_name, staff.last_name
order by num desc;
--6. How many different district names are there?
select COUNT(distinct district) as distinct_district_names from address;
--7. What film has the most actors in it? (use film_actor table and get film_id)
select film.film_id, title, COUNT(actor_id) as num from film
left join film_actor
on film.film_id = film_actor.film_id
group by film.film_id, title
order by num desc;
--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select store_id, COUNT(last_name) as num from customer
where last_name like '%es' and store_id = 1
group by store_id;
--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
select amount, COUNT(rental_id) from payment
where customer_id between 380 and 430
group by amount having COUNT(rental_id) > 250;
--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
select COUNT(distinct rating) from film;
select rating, COUNT(film_id) from film
group by rating
order by COUNT(film_id) desc;