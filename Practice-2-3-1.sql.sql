SELECT 
    a.actor_id,
    a.first_name,
    a.last_name,
    MAX(f.release_year) as last_film_year,
    2017 - MAX(f.release_year) as years_inactive
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY years_inactive DESC
LIMIT 5;