WITH regional_sales AS (
    SELECT
        c.region AS region,
        SUM(od.unit_price * od.quantity) AS revenue
        FROM customers c
        JOIN orders o
        ON c.customer_id = o.customer_id
        JOIN order_details od
        ON od.order_id = o.order_id
        GROUP BY c.region
        
)

SELECT 
    region,
    revenue,
    Rank() OVER (ORDER BY revenue DESC)
    FROM regional_sales
    WHERE region IS NOT NULL
    Order By revenue DESC;
