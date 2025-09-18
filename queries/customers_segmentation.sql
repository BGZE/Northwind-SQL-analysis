WITH sales AS (
    SELECT
        c.customer_id AS id,
        c.region,
        SUM(od.unit_price * od.quantity) AS revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_details od
        ON od.order_id = o.order_id
    GROUP BY c.customer_id, c.region
)

SELECT 
    id,
    region,
    revenue,
    CASE 
        WHEN revenue < 4000 THEN 'Low revenue'
        WHEN revenue > 10000 THEN 'High revenue'
        ELSE 'Middle revenue'
    END AS revenue_segment
FROM sales
WHERE region IS NOT NULL
ORDER BY revenue DESC;
