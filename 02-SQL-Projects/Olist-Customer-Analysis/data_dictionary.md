Olist Database Data Dictionary

## Customers Table

| Column | Description |
|---|---|
| customer_id | Unique order customer identifier |
| customer_unique_id | Permanent customer identifier |
| customer_city | Customer city |
| customer_state | Customer state |

## Orders Table

| Column | Description |
|---|---|
| order_id | Unique order identifier |
| customer_id | Customer reference |
| order_status | Order completion status |
| order_purchase_timestamp | Date order was placed |

## Order Items Table

| Column | Description |
|---|---|
| order_id | Order identifier |
| product_id | Product identifier |
| seller_id | Seller identifier |
| price | Product price |
| freight_value | Shipping cost |

## Payments Table

| Column | Description |
|---|---|
| order_id | Order identifier |
| payment_type | Payment method |
| payment_value | Amount paid |

## Products Table

| Column | Description |
|---|---|
| product_id | Product identifier |
| product_category_name | Product category |
| product_weight_g | Product weight |
