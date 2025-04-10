WITH staff_profits AS (
    SELECT 
        s.store_id,
        st.staff_id,
        st.first_name,
        st.last_name,
        SUM(p.amount) as total_profit,
        ROW_NUMBER() OVER (PARTITION BY s.store_id ORDER BY SUM(p.amount) DESC) as rn
    FROM store s
    JOIN staff st ON s.store_id = st.store_id
    JOIN payment p ON st.staff_id = p.staff_id
    WHERE EXTRACT(YEAR FROM p.payment_date) = 2017
    GROUP BY s.store_id, st.staff_id, st.first_name, st.last_name
)
SELECT 
    store_id,
    staff_id,
    first_name,
    last_name,
    total_profit
FROM staff_profits
WHERE rn = 1;