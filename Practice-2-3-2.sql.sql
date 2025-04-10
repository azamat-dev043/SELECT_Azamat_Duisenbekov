SELECT 
    a.actor_id,
    a.first_name,
    a.last_name,
    COALESCE(MAX(f.release_year), 0) as last_film_year,
    CASE 
        WHEN MAX(f.release_year) IS NULL THEN 2017
        ELSE 2017 - MAX(f.release_year) 
    END as years_inactive
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY years_inactive DESC
LIMIT 5;