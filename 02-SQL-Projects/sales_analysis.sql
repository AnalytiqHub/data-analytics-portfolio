
-- Question 1
-- What is the total revenue?
-- =====================================================

SELECT
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM olist_order_payments_dataset;
-- =====================================================
-- Question 2
-- What is the average order value?
-- =====================================================

SELECT
    ROUND(AVG(payment_value), 2) AS average_order_value
FROM olist_order_payments_dataset;

-- =====================================================
-- Question 3:
-- Average order value ....How much does a customer spend per order on average?
-- =====================================================

SELECT
    ROUND(AVG(order_total),2) AS average_order_value
FROM
(
    SELECT
        order_id,
        SUM(payment_value) AS order_total
    FROM olist_order_payments_dataset
    GROUP BY order_id
) sales;
-- =====================================================
-- Question 4
-- Monthly Revenue Trend
-- =====================================================

SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS purchase_month,
    ROUND(SUM(p.payment_value),2) AS revenue
FROM olist_orders_dataset o
JOIN olist_order_payments_dataset p
ON o.order_id = p.order_id
GROUP BY purchase_month
ORDER BY purchase_month;
-- =====================================================
-- Question 5:
-- Top product categories by revenue
-- =====================================================

SELECT 
    opd.product_category_name,
    SUM(op.payment_value) AS revenue
FROM olist_order_items_dataset AS oi
JOIN olist_order_payments_dataset AS op
    ON oi.order_id = op.order_id
JOIN olist_products_dataset AS opd
    ON opd.product_id = oi.product_id
GROUP BY opd.product_category_name
ORDER BY revenue DESC
LIMIT 5;


-- =====================================================
-- Question 6:
-- Payment method analysis
-- =====================================================

SELECT
    payment_type,
    COUNT(DISTINCT order_id) AS number_of_orders,
    ROUND(SUM(payment_value),2) AS revenue
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY revenue DESC;

-- =====================================================
-- Question 7:
-- Revenue by state
-- =====================================================

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
