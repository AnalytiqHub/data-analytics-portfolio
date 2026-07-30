# Sales Insights - Olist E-Commerce Business Analysis

## Project Overview

This project analyzes sales performance, customer behavior, product performance, and operational metrics using the Olist E-Commerce dataset.

The objective is to identify key business insights that can help improve revenue growth, customer retention, product strategy, and operational efficiency.

---

# Key Sales Metrics

## 1. Revenue Performance

**Business Question:**  
How much revenue did the company generate?

**SQL Analysis:**
- Calculated total revenue using customer payment transactions.
- Analyzed revenue contribution across products, categories, sellers, and regions.

**Insight:**
- Revenue analysis helps identify the strongest revenue drivers and areas where the business should focus growth efforts.

**Business Recommendation:**
- Invest more marketing resources into high-performing categories.
- Analyze underperforming categories to identify opportunities for improvement.

---

# 2. Average Order Value (AOV)

**Business Question:**  
How much does a customer spend per order on average?

**SQL Analysis:**
- Calculated average customer order value by summing payment amounts per order and finding the overall average.

**Insight:**
- Average order value indicates customer purchasing behavior and helps measure the effectiveness of upselling strategies.

**Business Recommendation:**
- Introduce product bundles and cross-selling recommendations.
- Offer discounts based on minimum purchase thresholds to increase basket size.

---

# Product Performance Insights

## 3. Top Revenue-Generating Product Categories

**Business Question:**  
Which product categories generate the most revenue?

**SQL Analysis:**
- Joined order items, payments, and product tables.
- Ranked categories based on total revenue generated.

**Insight:**
- A small number of product categories contribute a significant portion of total revenue.

**Business Recommendation:**
- Prioritize inventory availability for top-performing categories.
- Create targeted campaigns around high-revenue products.

---

## 4. Best-Selling Products

**Business Question:**  
Which products have the highest sales volume?

**SQL Analysis:**
- Counted product orders to identify products with the highest number of units sold.

**Insight:**
- High-volume products indicate strong customer demand.

**Business Recommendation:**
- Maintain sufficient stock levels for popular products.
- Promote related products to increase additional sales.

---

# Customer Behavior Insights

## 5. Customer Spending Analysis

**Business Question:**  
Who are the highest-value customers?

**SQL Analysis:**
- Calculated total spending per customer.
- Ranked customers based on purchase value.

**Insight:**
- Identifying high-value customers helps businesses focus retention efforts.

**Business Recommendation:**
- Create loyalty programs for high-spending customers.
- Provide personalized offers based on customer purchase history.

---

## 6. Repeat Customer Analysis

**Business Question:**  
Are customers returning after their first purchase?

**SQL Analysis:**
- Identified customers with more than one order.

**Insight:**
- Repeat customers are important because retaining existing customers is generally more cost-effective than acquiring new ones.

**Business Recommendation:**
- Develop customer retention campaigns.
- Send personalized recommendations after purchase.
- Create loyalty rewards for repeat buyers.

---

# Payment Insights

## 7. Payment Method Analysis

**Business Question:**  
Which payment methods are most commonly used?

**SQL Analysis:**
- Analyzed transaction volume and revenue by payment type.

**Insight:**
- Understanding customer payment preferences helps optimize checkout experience.

**Business Recommendation:**
- Continue supporting popular payment methods.
- Improve payment flexibility to reduce abandoned purchases.

---

# Geographic Insights

## 8. Revenue by Customer Location

**Business Question:**  
Which regions generate the highest revenue?

**SQL Analysis:**
- Compared revenue contribution by customer state.

**Insight:**
- Revenue is concentrated in specific geographic areas.

**Business Recommendation:**
- Increase marketing investment in high-performing regions.
- Investigate growth opportunities in lower-performing regions.

---

# Operational Insights

## 9. Delivery Performance

**Business Question:**  
How efficiently are orders delivered?

**SQL Analysis:**
- Calculated average delivery time.
- Compared actual delivery dates with estimated delivery dates.

**Insight:**
- Delivery experience directly impacts customer satisfaction and reviews.

**Business Recommendation:**
- Improve logistics planning.
- Monitor sellers with frequent delivery delays.

---

## 10. Customer Satisfaction Analysis

**Business Question:**  
How satisfied are customers?

**SQL Analysis:**
- Evaluated average review scores and review distribution.

**Insight:**
- Customer reviews provide feedback about product quality and delivery experience.

**Business Recommendation:**
- Investigate low-rated products.
- Improve seller quality monitoring.
- Address delivery issues affecting customer experience.

---

# Overall Business Recommendations

## Increase Customer Retention
- Build loyalty programs for repeat customers.
- Use customer purchase history for personalized recommendations.

## Improve Revenue Growth
- Focus marketing efforts on high-performing categories.
- Encourage larger purchases through bundles and promotions.

## Optimize Operations
- Reduce delivery delays.
- Improve seller performance monitoring.

## Improve Customer Experience
- Analyze negative reviews.
- Address common customer complaints.

---

# Tools Used

- SQL (PostgreSQL)
- Power BI
- Tableau
- Excel
- GitHub

---

# Conclusion

The analysis provides insights into sales performance, customer behavior, product trends, and operational efficiency.

By combining revenue analysis with customer and delivery insights, businesses can make data-driven decisions to increase sales, improve customer satisfaction, and optimize operations.
