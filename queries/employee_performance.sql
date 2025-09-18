WITH order_counts AS(
    SELECT
        COUNT(o.order_id) AS orders,
        o.employee_id AS employee
        FROM orders o
        JOIN employees e
        ON e.employee_id = o.employee_id
        GROUP BY o.employee_id
)

SELECT
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    oc.orders,
    RANK() OVER (ORDER BY oc.orders DESC) AS employee_rank
FROM order_counts oc
JOIN employees e ON e.employee_id = oc.employee
ORDER BY employee_rank;
