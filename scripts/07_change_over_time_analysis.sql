/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: DATEPART(), DATETRUNC(), FORMAT()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

-- analyze sales performance over time
-- quick date functions
SELECT
year(order_date) as order_year,
month(order_date) as order_month,
sum(sales_amount) as total_sales,
COUNT(distinct customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
where order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
order by YEAR(order_date), MONTH(order_date);


-- datetrunc()
SELECT
DATETRUNC(month,order_date) as order_date,
sum(sales_amount) as total_sales,
COUNT(distinct customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
where order_date IS NOT NULL
GROUP BY DATETRUNC(month,order_date)
order by DATETRUNC(month,order_date);


-- format()
SELECT
FORMAT(order_date, 'yyyy-MMM') as order_date,
sum(sales_amount) as total_sales,
COUNT(distinct customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
where order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
order by FORMAT(order_date, 'yyyy-MMM');