/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

-- explore all the countries our customers come from
SELECT DISTINCT country
FROM gold.dim_customer;

-- explore all the categories "The major Divisions"
SELECT DISTINCT product_name, category, subcategory
FROM gold.dim_products
order by category, subcategory, product_name;

