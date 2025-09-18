-- creating CTE to get the most recent order from each customer
-- ===============================
WITH last_orders AS (
    SELECT 
        customer_id,
        MAX(order_date) AS last_order_date
    FROM orders
    GROUP BY customer_id
),

-- getting the most recent date of the dataset

most_recent_date AS (
    SELECT MAX(order_date) AS max_order_date FROM orders
),

-- assigning a boolean 1/0 as a churn_flag column to flag customer's churn

churn_flags AS (SELECT 
    l.customer_id,
    c.region AS region,
    l.last_order_date,
    d.max_order_date,
    (d.max_order_date - l.last_order_date) AS days_since_last_order,
    CASE 
        WHEN (d.max_order_date - l.last_order_date) > 30 THEN 1
        ELSE 0
    END AS churn_flag
FROM last_orders l
CROSS JOIN most_recent_date d
JOIN customers c ON c.customer_id = l.customer_id
)
-- ===============================


-- ===============================
-- viewing the table
--SELECT * FROM churn_flags;
-- ===============================


-- ===============================
-- Overall Churn rates for customers who have not place orders in 30 days frame.
SELECT
    ROUND(100 * SUM(churn_flag)::numeric/ COUNT(*), 2) AS churn_rate_percent
FROM churn_flags;
-- ===============================


-- Same CTE as above 
-- ===============================
-- creating CTE to get the most recent order from each customer
WITH last_orders AS (
    SELECT 
        customer_id,
        MAX(order_date) AS last_order_date
    FROM orders
    GROUP BY customer_id
),

-- getting the most recent date of the dataset

most_recent_date AS (
    SELECT MAX(order_date) AS max_order_date FROM orders
),

-- assigning a boolean 1/0 as a churn_flag column to flag customer's churn

churn_flags AS (SELECT 
    l.customer_id,
    c.region AS region,
    l.last_order_date,
    d.max_order_date,
    (d.max_order_date - l.last_order_date) AS days_since_last_order,
    CASE 
        WHEN (d.max_order_date - l.last_order_date) > 30 THEN 1
        ELSE 0
    END AS churn_flag
FROM last_orders l
CROSS JOIN most_recent_date d
JOIN customers c ON c.customer_id = l.customer_id
)
-- ===============================

-- ===============================
-- Churn rates by region
SELECT
    region,
    ROUND(100 * SUM(churn_flag)::numeric/ COUNT(*), 2) AS churn_rate_percent
FROM churn_flags
GROUP BY region
ORDER BY churn_rate_percent DESC
LIMIT 10;
-- ===============================
