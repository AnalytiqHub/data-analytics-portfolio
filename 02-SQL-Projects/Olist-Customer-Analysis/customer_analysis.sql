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
