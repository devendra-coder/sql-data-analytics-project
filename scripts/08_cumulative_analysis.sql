/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/

-- Calculate the total sales per month 
-- and the running total of sales over time 
SELECT
order_date,
total_sales,
sum(total_sales) over(PARTITION BY datetrunc(YEAR,order_date) ORDER BY order_date) as running_total_sales,
avg(avg_price) over(order by order_date) as moving_avg_price
from(
    SELECT 
    datetrunc(MONTH,order_date) as order_date,
    sum(sales_amount) as total_sales,
    avg(price) as avg_price
    from gold.fact_sales
    where order_date IS NOT NULL
    GROUP BY datetrunc(MONTH,order_date)
)t