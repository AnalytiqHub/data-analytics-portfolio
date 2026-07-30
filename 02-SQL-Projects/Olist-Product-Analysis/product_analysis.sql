Query 1: Which product categories generate the most revenue?
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM olist_order_items_dataset AS oi
JOIN olist_products_dataset AS p
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC;


Query 2:Which product categories sell the highest number of items?
SELECT
    p.product_category_name,
    COUNT(*) AS total_items_sold
FROM olist_order_items_dataset AS oi
JOIN olist_products_dataset AS p
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_items_sold DESC;

Query 3: Top 10 products by revenue
SELECT
    oi.product_id,
    p.product_category_name,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM olist_order_items_dataset AS oi
JOIN olist_products_dataset AS p
    ON oi.product_id = p.product_id
GROUP BY
    oi.product_id,
    p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;

Query 4: Product categories with the highest average selling price
SELECT
    p.product_category_name,
    ROUND(AVG(oi.price), 2) AS average_price
FROM olist_order_items_dataset AS oi
JOIN olist_products_dataset AS p
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY average_price DESC;

Query 5: Product categories with the highest average review score
SELECT
    p.product_category_name,
    ROUND(AVG(r.review_score), 2) AS average_review_score
FROM olist_order_items_dataset AS oi
JOIN olist_products_dataset AS p
    ON oi.product_id = p.product_id
JOIN olist_order_reviews_dataset AS r
    ON oi.order_id = r.order_id
GROUP BY p.product_category_name
ORDER BY average_review_score DESC;

Query 6: Categories receiving the most customer reviews

SELECT
    p.product_category_name,
    COUNT(r.review_id) AS total_reviews
FROM olist_order_items_dataset AS oi
JOIN olist_products_dataset AS p
    ON oi.product_id = p.product_id
JOIN olist_order_reviews_dataset AS r
    ON oi.order_id = r.order_id
GROUP BY p.product_category_name
ORDER BY total_reviews DESC;

Query 7: Products with high revenue but low ratings

SELECT
    oi.product_id,
    p.product_category_name,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    ROUND(AVG(r.review_score), 2) AS average_review_score
FROM olist_order_items_dataset AS oi
JOIN olist_products_dataset AS p
    ON oi.product_id = p.product_id
JOIN olist_order_reviews_dataset AS r
    ON oi.order_id = r.order_id
GROUP BY
    oi.product_id,
    p.product_category_name
HAVING SUM(oi.price) > 5000
   AND AVG(r.review_score) < 3.5
ORDER BY total_revenue DESC;
