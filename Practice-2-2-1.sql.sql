SELECT 
    f.film_id,
    f.title,
    COUNT(r.rental_id) as rental_count,
    f.rating as expected_age_rating
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title, f.rating
ORDER BY rental_count DESC
LIMIT 5;