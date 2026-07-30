-- =====================================================
-- Olist E-Commerce Sales Analysis
-- sales_analysis.sql
-- =====================================================


-- 1. Total Revenue Generated
SELECT
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM olist_order_payments_dataset;



-- 2. Total Number of Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM olist_orders_dataset;



-- 3. Average Order Value (AOV)
SELECT
    ROUND(AVG(order_total), 2) AS average_order_value
FROM
(
    SELECT
        order_id,
        SUM(payment_value) AS order_total
    FROM olist_order_payments_dataset
    GROUP BY order_id
) AS order_summary;



-- 4. Revenue by Product Category
SELECT
    p.product_category_name,
    ROUND(SUM(op.payment_value), 2) AS revenue
FROM olist_order_items_dataset oi

JOIN olist_order_payments_dataset op
ON oi.order_id = op.order_id

JOIN olist_products_dataset p
ON oi.product_id = p.product_id

GROUP BY p.product_category_name
ORDER BY revenue DESC;



-- 5. Top 10 Product Categories by Revenue
SELECT
    p.product_category_name,
    ROUND(SUM(op.payment_value), 2) AS revenue
FROM olist_order_items_dataset oi

JOIN olist_order_payments_dataset op
ON oi.order_id = op.order_id

JOIN olist_products_dataset p
ON oi.product_id = p.product_id

GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 10;



-- 6. Top Selling Products by Quantity
SELECT
    oi.product_id,
    COUNT(*) AS units_sold
FROM olist_order_items_dataset oi

GROUP BY oi.product_id
ORDER BY units_sold DESC
LIMIT 10;



-- 7. Top Products by Revenue
SELECT
    oi.product_id,
    ROUND(SUM(op.payment_value),2) AS revenue
FROM olist_order_items_dataset oi

JOIN olist_order_payments_dataset op
ON oi.order_id = op.order_id

GROUP BY oi.product_id
ORDER BY revenue DESC
LIMIT 10;



-- 8. Monthly Revenue Trend
SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    ROUND(SUM(p.payment_value),2) AS monthly_revenue
FROM olist_orders_dataset o

JOIN olist_order_payments_dataset p
ON o.order_id = p.order_id

GROUP BY month
ORDER BY month;



-- 9. Orders by Month
SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    COUNT(order_id) AS total_orders
FROM olist_orders_dataset

GROUP BY month
ORDER BY month;



-- 10. Revenue by Payment Method
SELECT
    payment_type,
    ROUND(SUM(payment_value),2) AS revenue
FROM olist_order_payments_dataset

GROUP BY payment_type
ORDER BY revenue DESC;



-- 11. Average Payment Value by Payment Method
SELECT
    payment_type,
    ROUND(AVG(payment_value),2) AS average_payment
FROM olist_order_payments_dataset

GROUP BY payment_type
ORDER BY average_payment DESC;



-- 12. Top Sellers by Revenue
SELECT
    oi.seller_id,
    ROUND(SUM(op.payment_value),2) AS revenue
FROM olist_order_items_dataset oi

JOIN olist_order_payments_dataset op
ON oi.order_id = op.order_id

GROUP BY oi.seller_id
ORDER BY revenue DESC
LIMIT 10;



-- 13. Customer Spending Analysis
SELECT
    c.customer_unique_id,
    ROUND(SUM(p.payment_value),2) AS total_spent
FROM olist_customers_dataset c

JOIN olist_orders_dataset o
ON c.customer_id = o.customer_id

JOIN olist_order_payments_dataset p
ON o.order_id = p.order_id

GROUP BY c.customer_unique_id

ORDER BY total_spent DESC
LIMIT 10;



-- 14. Repeat Customers
SELECT
    customer_unique_id,
    COUNT(DISTINCT order_id) AS number_of_orders
FROM olist_customers_dataset c

JOIN olist_orders_dataset o
ON c.customer_id = o.customer_id

GROUP BY customer_unique_id

HAVING COUNT(DISTINCT order_id) > 1

ORDER BY number_of_orders DESC;



-- 15. Customer Satisfaction (Average Review Score)
SELECT
    ROUND(AVG(review_score),2) AS average_review_score
FROM olist_order_reviews_dataset;



-- 16. Review Score Distribution
SELECT
    review_score,
    COUNT(*) AS number_of_reviews
FROM olist_order_reviews_dataset

GROUP BY review_score

ORDER BY review_score;



-- 17. Delivery Performance
SELECT
    ROUND(
        AVG(
        EXTRACT(DAY FROM 
        (order_delivered_customer_date - order_purchase_timestamp))
        ),2
    ) AS avg_delivery_days

FROM olist_orders_dataset

WHERE order_delivered_customer_date IS NOT NULL;



-- 18. Late Delivery Percentage
SELECT
    ROUND(
        COUNT(*) FILTER(
        WHERE order_delivered_customer_date > order_estimated_delivery_date
        ) * 100.0 / COUNT(*),
        2
    ) AS late_delivery_percentage

FROM olist_orders_dataset;



-- 19. Revenue by Customer State
SELECT
    c.customer_state,
    ROUND(SUM(p.payment_value),2) AS revenue

FROM olist_customers_dataset c

JOIN olist_orders_dataset o
ON c.customer_id = o.customer_id

JOIN olist_order_payments_dataset p
ON o.order_id = p.order_id

GROUP BY c.customer_state

ORDER BY revenue DESC;



-- 20. Freight Cost Analysis
SELECT
    ROUND(AVG(freight_value),2) AS average_freight_cost,
    ROUND(SUM(freight_value),2) AS total_freight_cost

FROM olist_order_items_dataset;
