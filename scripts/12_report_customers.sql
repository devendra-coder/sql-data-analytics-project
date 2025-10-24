/*
===============================================================================
Customer Report
===============================================================================
Purpose:
    - This report consolidates key customer metrics and behaviors

Highlights:
    1. Gathers essential fields such as names, ages, and transaction details.
	2. Segments customers into categories (VIP, Regular, New) and age groups.
    3. Aggregates customer-level metrics:
	   - total orders
	   - total sales
	   - total quantity purchased
	   - total products
	   - lifespan (in months)
    4. Calculates valuable KPIs:
	    - recency (months since last order)
		- average order value
		- average monthly spend
===============================================================================
*/

-- =============================================================================
-- Create Report: gold.report_customers
-- =============================================================================
IF OBJECT_ID('gold.report_customers', 'V') IS NOT NULL
    DROP VIEW gold.report_customers;
GO

CREATE VIEW gold.report_customers AS

with base_query as (
    -- 1) Base Query: Retrieves core columns from tables
SELECT
f.order_number,
f.product_key,
f.order_date,
f.sales_amount,
f.quantity,
c.customer_key,
c.customer_number,
CONCAT(c.first_name, ' ', c.last_name) as Customer_name,
DATEDIFF(year, c.birthdate, GETDATE()) age
from gold.fact_sales f
LEFT JOIN
gold.dim_customer c
on f.customer_key = c.customer_key
where order_date is not null
), customer_aggregation as(
SELECT
customer_key,
customer_number,
Customer_name,
age,
count(distinct order_number) as total_orders,
sum(sales_amount) as total_sales,
sum(quantity) as total_quantity,
count(distinct product_key) as total_products,
MAX(order_date) as last_order_date,
DATEDIFF(month,MIN(order_date), MAX(order_date)) as customer_lifespan
from base_query
GROUP BY customer_key,
customer_number,
Customer_name,
age)

SELECT
customer_key,
customer_number,
Customer_name,
age,
CASE 
	 WHEN age < 20 THEN 'Under 20'
	 WHEN age between 20 and 29 THEN '20-29'
	 WHEN age between 30 and 39 THEN '30-39'
	 WHEN age between 40 and 49 THEN '40-49'
	 ELSE '50 and above'
END AS age_group,
case when customer_lifespan >=12 and total_sales > 5000 then 'VIP'
     when customer_lifespan >=12 and total_sales <= 5000 then 'Regular'
     else 'New' 
end as customer_segment,
last_order_date,
DATEDIFF(month, last_order_date, GETDATE()) as recency,
total_orders,
total_sales,
total_quantity,
total_products,
customer_lifespan,
-- compute average order value (AVO)
case when total_sales = 0 then 0
     else total_sales / total_orders
end as avg_order_value,
-- average monthly spend
case when customer_lifespan = 0 then total_sales
     else total_sales / customer_lifespan
end as avg_monthly_spend
from customer_aggregation
