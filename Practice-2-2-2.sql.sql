SELECT 
    f.film_id,
    f.title,
    (
        SELECT COUNT(*)
        FROM rental r
        JOIN inventory i ON r.inventory_id = i.inventory_id
        WHERE i.film_id = f.film_id
    ) as rental_count,
    f.rating as expected_age_rating
FROM film f
ORDER BY rental_count DESC
LIMIT 5;