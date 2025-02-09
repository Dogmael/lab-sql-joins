USE sakila;

-- 1 List the number of films per category.
SELECT film_category.category_id, COUNT(film.title)
FROM film
LEFT JOIN film_category ON film.film_id = film_category.film_id
GROUP BY category_id
ORDER BY film_category.category_id;

-- 2 Retrieve the store ID, city, and country for each store.
SELECT store.store_id, city.city, country.country
FROM store
LEFT JOIN address ON store.address_id = address.address_id
LEFT JOIN city ON address.city_id = city.city_id
LEFT JOIN country ON city.country_id = country.country_id;

-- 3 Calculate the total revenue generated by each store in dollars.
SELECT store.store_id, SUM(payment.amount) AS total_revenue
FROM store
LEFT JOIN customer ON store.store_id = customer.store_id
LEFT JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY store_id;

-- 4 Determine the average running time of films for each category.
SELECT film_category.category_id, AVG(film.length)
FROM film
LEFT JOIN film_category ON film.film_id = film_category.film_id
GROUP BY category_id
ORDER BY film_category.category_id;

-- 5 Identify the film categories with the longest average running time.
SELECT film_category.category_id, AVG(film.length)
FROM film
LEFT JOIN film_category ON film.film_id = film_category.film_id
GROUP BY category_id
ORDER BY AVG(film.length) DESC
LIMIT 1;

-- 6 Display the top 10 most frequently rented movies in descending order.
SELECT film.title, COUNT(rental.rental_id)
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY COUNT(rental.rental_id) DESC
LIMIT 10;

-- 7 Determine if "Academy Dinosaur" can be rented from Store 1.
SELECT film.title, inventory.store_id
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
WHERE film.title = "Academy Dinosaur" AND inventory.store_id = 1;