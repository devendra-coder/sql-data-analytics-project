/*
===============================================================================
Data Segmentation Analysis
===============================================================================
Purpose:
    - To group data into meaningful categories for targeted insights.
    - For customer segmentation, product categorization, or regional analysis.

SQL Functions Used:
    - CASE: Defines custom segmentation logic.
    - GROUP BY: Groups data into segments.
===============================================================================
*/

/*Segment products into cost ranges and 
count how many products fall into each segment*/
with product_segments as (
SELECT
product_key,
product_name,
cost,
case when cost < 100 then 'Below 100'
     when cost between 100 and 500 then '100-500'
     when cost between 500 and 1000 then '500-1000'
     else 'Above 1000' 
end as cost_range
from gold.dim_products)
SELECT 
    cost_range,
    COUNT(product_key) AS total_products
FROM product_segments
GROUP BY cost_range
ORDER BY total_products DESC;

/*Group customers into three segments based on their spending behavior:
	- VIP: Customers with at least 12 months of history and spending more than €5,000.
	- Regular: Customers with at least 12 months of history but spending €5,000 or less.
	- New: Customers with a lifespan less than 12 months.
And find the total number of customers by each group
*/
with customer_spending as (
SELECT
c.customer_key,
sum(f.sales_amount) as total_spending,
MIN(order_date) as first_order,
MAX(order_date) as last_order,
DATEDIFF(month,MIN(order_date),MAX(order_date)) as customer_lifespan
from gold.fact_sales f
LEFT JOIN gold.dim_customer c
on f.customer_key = c.customer_key
group by c.customer_key)


SELECT
customer_segment,
count(customer_key) as total_customers
from(
SELECT 
customer_key,
case when customer_lifespan >=12 and total_spending > 5000 then 'VIP'
     when customer_lifespan >=12 and total_spending <= 5000 then 'Regular'
     else 'New' 
end as customer_segment
from customer_spending
)t
GROUP BY customer_segment
ORDER BY total_customers DESC;