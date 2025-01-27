USE sakila;
SELECT * FROM film; -- Ver tabla a consultar

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.

SELECT 
DISTINCT title
FROM film;

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".

SELECT 
title
FROM film
WHERE rating = "PG-13";

-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.

SELECT 
title,
description
FROM film
WHERE description LIKE "%amazing%";

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT * FROM film; -- Ver tabla a consultar

SELECT 
title AS peliculas_duracion_mayor120
FROM film
WHERE length > 120;

-- 5. Encuentra los nombres de todos los actores, muestralos en una sola columna que se llame nombre_actor y contenga nombre y apellido.

SELECT * FROM actor; -- Ver la tabla a consultar

SELECT
CONCAT (first_name, " ", last_name) AS nombre_actor
FROM actor;

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.

SELECT
first_name,
last_name
FROM actor
WHERE last_name IN ("Gibson");

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.

SELECT * FROM actor; -- Ver tabla a consultar<<

SELECT 
first_name
FROM actor
WHERE actor_id BETWEEN 10 AND 20;

-- 8. Encuentra el título de las películas en la tabla film que no tengan clasificacion "R" ni "PG-13".

SELECT * FROM film; -- Ver tabla a consultar

SELECT
title
FROM film
WHERE rating NOT IN ("R", "PG-13");

-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento

SELECT * FROM film; -- Ver tabla a consultar

SELECT
rating,
COUNT(rating) AS cantidad_total_peliculas
FROM film
GROUP BY rating;

-- 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
USE sakila;
SELECT * FROM rental;
SELECT * FROM customer;

SELECT 
  c.customer_id,
  c.first_name,
  c.last_name,
  COUNT(r.rental_id) AS total_peliculas_alquiladas
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY r.customer_id;

-- 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.

-- Ver tabla a consultar
SELECT * FROM rental; -- Peliculas alquiladas (inventory id)
SELECT * FROM inventory; -- (inventory_id) (film_id)
SELECT * FROM film_category; -- (film_id) (category_id)
SELECT * FROM category; -- Nombre categoria (category_id) (name)


SELECT 
c.name,
COUNT(r.rental_id) AS peliculas_alquiladas
FROM rental r
INNER JOIN inventory i
ON r.inventory_id = i.inventory_id
INNER JOIN film_category fc
ON i.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
GROUP BY c.category_id;


-- 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y 
-- muestra la clasificación junto con el promedio de duración.

SELECT * FROM film; -- Ver tabla a consultar

SELECT 
rating AS "Clasificación", 
AVG (length) AS "Promedio de duración"
FROM film
GROUP BY rating;

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".

-- Ver tabla a consultar
SELECT * FROM film; -- (title) (film id)
SELECT * FROM film_actor; -- (film_id) (actor_id)
SELECT * FROM actor; -- (actor_id) (first_name) (last_name) 

SELECT
a.first_name,
a.last_name
FROM actor a
INNER JOIN film_actor fa
ON fa.actor_id = a.actor_id
INNER JOIN film f
ON fa.film_id = f.film_id
WHERE f.title = "Indian Love";

-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.

SELECT * FROM film; -- Ver tabla a consultar

SELECT 
title
FROM film
WHERE description LIKE "%dog%" OR "%cat%";


-- 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.

-- Ver tabla a consultar
SELECT * FROM film; -- (title) (film_id)
SELECT * FROM film_actor; -- (film_id) (actor_id)
SELECT * FROM actor; -- (actor_id) (first_name) (last_name)

SELECT
a.first_name,
a.last_name,
fa.film_id
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
WHERE fa.film_id IS NULL;


SELECT
a.actor_id,
a.first_name,
a.last_name,
fa.film_id -- Añado esta columna para comprobar que no hay ningún nulo.
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id;


-- 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010

SELECT
title
FROM film
WHERE release_year BETWEEN 2005 AND 2010;

-- 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".

-- Ver tabla a consultar
SELECT * FROM film; -- (title) (film_id)
SELECT * FROM film_category; -- (film_id) (category_id)
SELECT * FROM category; -- (category_id) (name)

SELECT 
f.title
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
WHERE c.name = "Family";

-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.

-- Ver tabla a consultar
SELECT * FROM actor; -- Ver tabla actores (actor_id) (first_name) (last_name)
SELECT * FROM film_actor; -- Ver tabla (actor_id) (film_id)

SELECT 
a.first_name,
a.last_name,
COUNT(fa.actor_id) AS num_peliculas_en_las_que_aparece
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY fa.actor_id
HAVING num_peliculas_en_las_que_aparece > 10;


-- 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.

SELECT * FROM film; -- Ver tabla a consultar

SELECT 
title
FROM film
WHERE rating = "R" AND length > 120;


-- 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.

-- Ver tabla a consultar
SELECT * FROM film; -- Ver tabla a consultar (title) (film_id) (length)
SELECT * FROM film_category; -- (film_id) (category_id)
SELECT * FROM category; -- (category_id) (name)

SELECT
c.name,
AVG(length) AS "promedio duración"
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fC.category_id = c.category_id
WHERE length > 120
GROUP BY c.name;

-- 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.

-- Ver tabla a consultar
SELECT * FROM actor; -- Ver tabla a consultar: (actor_id) (first_name)
SELECT * FROM film_actor; -- (actor_id) (film_id)


SELECT
a.first_name,
COUNT(fa.actor_id) AS peliculas_en_las_que_aparece
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY fa.actor_id
HAVING peliculas_en_las_que_aparece > 5;

-- 22. Encuentra el título de todas las películas que fueron alquiladas durante más de 5 días. Utiliza una 
-- subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona 
-- las películas correspondientes. Pista: Usamos DATEDIFF para calcular la diferencia entre una 
-- fecha y otra, ej: DATEDIFF(fecha_inicial, fecha_final)

SELECT * FROM rental; -- Ver tabla a consultar (inventory_id) (rental_date) (return_date)
SELECT * FROM inventory; -- (inventory_id) (film_id)
SELECT * FROM film; -- (film_id) (title)
/*
SELECT -- Subconsulta
rental_id,
inventory_id,
DATEDIFF(return_date, rental_date) AS "dias alquilada"
FROM rental
WHERE DATEDIFF(return_date, rental_date) > 5;
*/

SELECT
f.title
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id 
INNER JOIN rental r
ON i.inventory_id = r.inventory_id
WHERE i.inventory_id IN( 
	SELECT
	inventory_id
	FROM rental
	WHERE DATEDIFF(return_date, rental_date) > 5)
GROUP BY f.title;

-- 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la 
-- categoría "Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.

-- Ver tabla a consultar
SELECT * FROM actor; -- (first_name) (last_name) (actor_id)
SELECT * FROM film_actor; -- (actor_id) (film_id)
SELECT * FROM film_category; -- (film_id) (category_id)
SELECT * FROM category; -- (category_id) (name)


SELECT
a.first_name,
a.last_name
FROM actor a
WHERE CONCAT(a.first_name," ",a.last_name) NOT IN (
SELECT -- Subconsulta actores que SI han hecho peliculas de terror.
CONCAT(a.first_name," ",a.last_name)
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
INNER JOIN film_category fc
ON fa.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
WHERE c.name = "Horror");


-- 24. BONUS: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film con subconsultas.

-- Ver tabla a consultar
SELECT * FROM film; -- (title) (length) (film_id)
SELECT * FROM film_category; -- (film_id) (category_id)
SELECT * FROM category; -- (category_id) (name)

SELECT 
f.title
FROM film f
WHERE f.film_id IN (SELECT 
	fc.film_id
	FROM film_category fc
	INNER JOIN category c
	ON fc.category_id = c.category_id
	WHERE c.name = "Comedy")
AND f.length > 180;


-- 25. BONUS: Encuentra todos los actores que han actuado juntos en al menos una película. La 
-- consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que 
-- han actuado juntos. Pista: Podemos hacer un JOIN de una tabla consigo misma, poniendole un 
-- alias diferente.

USE sakila;
SELECT * FROM film_actor; -- (actor_id) (film_id)
SELECT * FROM actor; -- (actor_id) (first_name) (last_name)


