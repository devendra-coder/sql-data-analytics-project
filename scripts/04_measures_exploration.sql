/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

-- find the total sales
SELECT SUM(sales_amount) as total_sales
from gold.fact_sales

-- find how many items are sold
SELECT SUM(quantity) as total_quantity
from gold.fact_sales

-- find the average selling price
SELECT AVG(price) as avg_price
from gold.fact_sales

-- find the total number of orders
SELECT COUNT(order_number) as total_orders
from gold.fact_sales

SELECT COUNT(distinct order_number) as total_orders_without_duplicates
from gold.fact_sales

-- find the total number of products
SELECT count(product_key) as total_products
from gold.dim_products

-- find the total number of customers
SELECT count(customer_key) as total_customers   
from gold.dim_customer

-- find the total number of customers that has placed an order
SELECT count(distinct customer_key) as total_customers   
from gold.fact_sales

-- Generate a Report that shows all key metrics of the business
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(customer_key) FROM gold.dim_customer;