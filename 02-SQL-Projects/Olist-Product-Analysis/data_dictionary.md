# Data Dictionary - Olist Product Analysis

## Overview

This document describes the datasets and columns used for the Olist Product Analysis project.

The analysis uses product, order item, and customer review data to evaluate product performance, revenue contribution, sales volume, customer satisfaction, and shipping cost impact.

---

# Dataset: olist_products_dataset

Contains product-level information including category and physical attributes.

| Column                     | Description                                 |
| -------------------------- | ------------------------------------------- |
| product_id                 | Unique identifier for each product          |
| product_category_name      | Category name of the product                |
| product_name_length        | Number of characters in product name        |
| product_description_length | Number of characters in product description |
| product_photos_qty         | Number of product photos available          |
| product_weight_g           | Product weight in grams                     |
| product_length_cm          | Product length in centimeters               |
| product_height_cm          | Product height in centimeters               |
| product_width_cm           | Product width in centimeters                |

---

# Dataset: olist_order_items_dataset

Contains individual products purchased within each order.

| Column              | Description                                               |
| ------------------- | --------------------------------------------------------- |
| order_id            | Unique identifier for customer order                      |
| order_item_id       | Sequential number identifying items within the same order |
| product_id          | Product identifier linked to product dataset              |
| seller_id           | Seller identifier                                         |
| shipping_limit_date | Deadline for seller shipment                              |
| price               | Price paid for the product item                           |
| freight_value       | Shipping cost associated with the product item            |

---

# Dataset: olist_order_reviews_dataset

Contains customer feedback and satisfaction scores.

| Column                  | Description                           |
| ----------------------- | ------------------------------------- |
| review_id               | Unique identifier for customer review |
| order_id                | Order associated with the review      |
| review_score            | Customer rating from 1 to 5           |
| review_comment_title    | Review title provided by customer     |
| review_comment_message  | Review text provided by customer      |
| review_creation_date    | Date review was created               |
| review_answer_timestamp | Date review response was recorded     |

---

# Key Relationships

```text
products
    |
    | product_id
    |
order_items
    |
    | order_id
    |
reviews
```

---

# Key Metrics Created

| Metric                | Calculation                  |
| --------------------- | ---------------------------- |
| Total Revenue         | Sum of product price         |
| Total Items Sold      | Count of order items         |
| Average Product Price | Average product price        |
| Average Review Score  | Average customer rating      |
| Review Volume         | Count of customer reviews    |
| Freight Cost Impact   | Sum or average freight value |

---

# SQL Analysis Purpose

These datasets were combined to analyze:

* Top revenue-generating product categories
* Best-selling products
* Product sales performance
* Customer satisfaction by product category
* Products with high sales but low ratings
* Shipping cost impact on profitability

---

# Business Use Cases

The insights from this analysis can help businesses:

* Optimize product inventory decisions
* Identify high-performing categories
* Improve product quality based on customer feedback
* Prioritize marketing efforts
* Reduce shipping cost impact
* Improve overall customer experience

```
```

