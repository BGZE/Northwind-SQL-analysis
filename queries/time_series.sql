WITH monthly_sales AS (
    SELECT
        Date_Trunc('month', o.order_date) AS order_month,
        TO_CHAR(o.order_date, 'Month') AS full_month_name,
        SUM(od.quantity * od.unit_price) AS monthly_revenue
        FROM orders AS o
        JOIN order_details AS od
        ON o.order_id = od.order_id
        GROUP BY Date_Trunc('month', o.order_date),
         TO_CHAR(o.order_date, 'Month')
)

SELECT
    order_month,
    full_month_name,
    monthly_revenue
    FROM monthly_sales
    ORDER BY order_month;


WITH yearly_sales AS (
    SELECT
        DATE_PART('year', Date_Trunc('year', o.order_date)) AS order_year,
        SUM(od.quantity * od.unit_price) AS yearly_revenue
        FROM orders AS o
        JOIN order_details AS od
        ON o.order_id = od.order_id
        GROUP BY Date_Trunc('year', o.order_date)
)

SELECT
    order_year,
    yearly_revenue
    FROM yearly_sales
    ORDER BY order_year;
    
