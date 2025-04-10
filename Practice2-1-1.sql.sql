SELECT DISTINCT ON (s.store_id) 
    s.store_id,
    st.staff_id,
    st.first_name,
    st.last_name,
    SUM(p.amount) as total_profit
FROM store s
JOIN staff st ON s.store_id = st.store_id
JOIN payment p ON st.staff_id = p.staff_id
WHERE EXTRACT(YEAR FROM p.payment_date) = 2017
GROUP BY s.store_id, st.staff_id, st.first_name, st.last_name
ORDER BY s.store_id, total_profit DESC;