-- Retail Sales Analysis using SQL
-- Retail Sales Analysis

-- 1. Overall Sales
SELECT SUM(total_sales) AS total_sales
FROM customer_shopping_data;

-- 2. Sales Transactions by Category
SELECT category, COUNT(invoice_no) AS transaction_count
FROM customer_shopping_data
GROUP BY category;

-- 3. Total Sales by Customer
SELECT customer_id, SUM(total_sales) AS total_sales
FROM customer_shopping_data
GROUP BY customer_id;

-- 4. Total Sales by Gender
SELECT gender, SUM(total_sales) AS total_sales
FROM customer_shopping_data
GROUP BY gender;

-- 5. Total Sales by Payment Method
SELECT payment_method, SUM(total_sales) AS total_sales
FROM customer_shopping_data
GROUP BY payment_method;

-- 6. Monthly Sales
SELECT YEAR(invoice_date) AS year,
       MONTH(invoice_date) AS month,
       SUM(total_sales) AS total_sales
FROM customer_shopping_data
GROUP BY YEAR(invoice_date), MONTH(invoice_date)
ORDER BY year, month;

-- 7. Top 10 Customers
SELECT customer_id,
       SUM(total_sales) AS total_sales
FROM customer_shopping_data
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 10;

-- 8. Top 10 Categories
SELECT category,
       SUM(total_sales) AS total_sales
FROM customer_shopping_data
GROUP BY category
ORDER BY total_sales DESC
LIMIT 10;
-- 9. JOIN: Customer Sales Summary
SELECT
    c.customer_id,
    c.gender,
    c.category,
    c.total_sales,
    s.customer_total_sales
FROM customer_shopping_data AS c
JOIN (
    SELECT
        customer_id,
        SUM(total_sales) AS customer_total_sales
    FROM customer_shopping_data
    GROUP BY customer_id
) AS s
ON c.customer_id = s.customer_id
LIMIT 10;

-- 10. CTE: Categories with Sales Above $10 Million
WITH category_sales AS (
    SELECT
        category,
        SUM(total_sales) AS total_sales
    FROM customer_shopping_data
    GROUP BY category
)
SELECT
    category,
    total_sales
FROM category_sales
WHERE total_sales > 10000000
ORDER BY total_sales DESC;

-- 11. Subquery: Sales Above Average
SELECT
    customer_id,
    total_sales
FROM customer_shopping_data
WHERE total_sales > (
    SELECT AVG(total_sales)
    FROM customer_shopping_data
)
ORDER BY total_sales DESC
LIMIT 10;

-- 12. Window Function: Rank Sales
SELECT
    customer_id,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM customer_shopping_data
ORDER BY sales_rank
LIMIT 10;