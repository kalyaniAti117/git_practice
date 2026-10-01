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