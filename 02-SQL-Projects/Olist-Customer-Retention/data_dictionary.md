# Data Dictionary - Olist Customer Retention Analysis

## Overview

This document describes the datasets and columns used for the Olist Customer Retention Analysis project.

The analysis uses customer, order, payment, and review information to understand customer behavior, retention patterns, and lifetime value.

---

# Dataset: olist_customers_dataset

Contains customer information and location details.

| Column                   | Description                                                                  |
| ------------------------ | ---------------------------------------------------------------------------- |
| customer_id              | Unique identifier for each customer order record                             |
| customer_unique_id       | Unique identifier representing an individual customer across multiple orders |
| customer_zip_code_prefix | First five digits of customer postal code                                    |
| customer_city            | Customer city                                                                |
| customer_state           | Customer state                                                               |

---

# Dataset: olist_orders_dataset

Contains order-level transaction information.

| Column                        | Description                                    |
| ----------------------------- | ---------------------------------------------- |
| order_id                      | Unique identifier for each order               |
| customer_id                   | Customer identifier linked to customer dataset |
| order_status                  | Current status of the order                    |
| order_purchase_timestamp      | Date and time when order was purchased         |
| order_approved_at             | Date and time when payment was approved        |
| order_delivered_carrier_date  | Date order was handed to carrier               |
| order_delivered_customer_date | Date order was delivered to customer           |
| order_estimated_delivery_date | Estimated delivery date                        |

---

# Dataset: olist_order_payments_dataset

Contains payment transaction details.

| Column               | Description                               |
| -------------------- | ----------------------------------------- |
| order_id             | Order identifier linked to orders dataset |
| payment_sequential   | Payment sequence number                   |
| payment_type         | Payment method used                       |
| payment_installments | Number of payment installments            |
| payment_value        | Total payment amount                      |

---

# Dataset: olist_order_reviews_dataset

Contains customer feedback and review scores.

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

```
customers
    |
    | customer_id
    |
orders
    |
    | order_id
    |
payments


orders
    |
    | order_id
    |
reviews
```

---

# Key Metrics Created

| Metric                  | Calculation                              |
| ----------------------- | ---------------------------------------- |
| Total Customers         | Count of unique customer_unique_id       |
| Repeat Customers        | Customers with more than one order       |
| Retention Rate          | Repeat Customers / Total Customers × 100 |
| Customer Lifetime Value | Total payment value per customer         |

---

# SQL Analysis Purpose

These datasets were combined to analyze:

* Customer purchasing frequency
* Repeat purchase behavior
* Customer loyalty
* Customer satisfaction
* High-value customer segments

