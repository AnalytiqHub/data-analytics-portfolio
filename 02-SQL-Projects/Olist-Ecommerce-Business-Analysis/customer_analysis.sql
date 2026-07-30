-- ==========================================
-- Olist E-commerce Customer Analysis
-- Author: Aruna Sharma
-- Purpose: Analyze customer behavior
-- ==========================================


-- Question 1:
-- How many unique customers are there?

SELECT
COUNT(DISTINCT customer_unique_id) AS total_customers
FROM olist_customers_dataset;

-- ============================================================
-- Question 2
-- Business Question:
-- Which states have the largest customer base?
-- ============================================================

SELECT
    customer_state,
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM olist_customers_dataset
GROUP BY customer_state
ORDER BY total_customers DESC;
-- ============================================================
-- Question 3
-- Business Question:
-- Which cities have the highest customer concentration?
-- ============================================================

SELECT
    customer_city,
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM olist_customers_dataset
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 10;
-- ============================================================
-- Question 4
-- Business Question:
-- Which customers have placed more than one order?
-- ============================================================

SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;
-- ============================================================
-- Question 5
-- Business Question:
-- What percentage of customers made multiple purchases?
-- ============================================================

WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS total_orders
    FROM olist_customers_dataset c
    JOIN olist_orders_dataset o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)

SELECT
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE total_orders > 1) / COUNT(*),
        2
    ) AS repeat_customer_percentage
FROM customer_orders;
