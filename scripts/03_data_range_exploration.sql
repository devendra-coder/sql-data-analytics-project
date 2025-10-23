/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- find the date of the first and last order
-- how many years of sales are available
SELECT 
MIN(order_date) as first_order_date,
MAX(order_date) as last_order_date,
DATEDIFF(year,MIN(order_date), MAX(order_date)) as order_range_years
from gold.fact_sales 


-- find the youngest and the oldest customer
SELECT
MIN(birthdate) as oldest_birthdate,
DATEDIFF(year, MIN(birthdate), GETDATE()) as oldest_age,
MAX(birthdate) as youngest_birthdate,
DATEDIFF(year, MAX(birthdate), GETDATE()) as youngest_age
from gold.dim_customer