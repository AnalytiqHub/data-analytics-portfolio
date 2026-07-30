Query 1: Total number of unique customers
  SELECT
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM olist_customers_dataset;

Query 2: Total orders per customer
SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM olist_customers_dataset c

JOIN olist_orders_dataset o
ON c.customer_id = o.customer_id

GROUP BY c.customer_unique_id

ORDER BY total_orders DESC;

Query 3: Identify repeat customers

SELECT
    COUNT(*) AS repeat_customers
FROM
(
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS order_count
    FROM olist_customers_dataset c

    JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id

    GROUP BY c.customer_unique_id
) customer_orders

WHERE order_count > 1;


Query 4: Customer retention rate


SELECT
    ROUND(
        COUNT(*) FILTER (WHERE order_count > 1) * 100.0
        / COUNT(*),
        2
    ) AS retention_rate_percentage
FROM
(
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS order_count
    FROM olist_customers_dataset c

    JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id

    GROUP BY c.customer_unique_id
) customer_orders;
================================================================
Query 5: Do higher-rated customers return?
================================================================
SELECT
    r.review_score,
    COUNT(DISTINCT c.customer_unique_id) AS customers

FROM olist_customers_dataset c

JOIN olist_orders_dataset o
ON c.customer_id=o.customer_id

JOIN olist_order_reviews_dataset r
ON o.order_id=r.order_id

GROUP BY r.review_score

ORDER BY r.review_score DESC;
================================================================
Query 6: Top customers by lifetime value
===============================================================
SELECT
    c.customer_unique_id,
    ROUND(SUM(p.payment_value),2) AS lifetime_value

FROM olist_customers_dataset c

JOIN olist_orders_dataset o
ON c.customer_id = o.customer_id

JOIN olist_order_payments_dataset p
ON o.order_id = p.order_id

GROUP BY c.customer_unique_id

ORDER BY lifetime_value DESC

LIMIT 10;
