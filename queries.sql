CREATE DATABASE sales_analysis;
USE sales_analysis;
CREATE TABLE sales (
    row_id INT,
    order_id VARCHAR(50),
    order_date VARCHAR(50), 
    month VARCHAR(20),
    year INT,
    ship_date VARCHAR(50),  
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT,
    sales VARCHAR(50)  
);

ALTER TABLE sales ADD COLUMN order_year INT;
SET SQL_SAFE_UPDATES = 0;

UPDATE sales SET order_year = YEAR(order_date);

SET SQL_SAFE_UPDATES = 1;

SELECT 
    order_year AS Year,
    category AS Category,
    COUNT(order_id) AS Total_Orders,
    ROUND(SUM(sales), 2) AS Total_Revenue
FROM sales
GROUP BY order_year, category
ORDER BY order_year DESC, Total_Revenue DESC;

SELECT * FROM sales LIMIT 10;

SELECT SUM(sales) AS total_revenue
FROM sales;

SELECT 
region,
SUM(sales) AS total_sales
FROM sales
GROUP BY region;

SELECT 
product_name,
SUM(sales) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT 
category,
SUM(sales) AS total_sales
FROM sales
GROUP BY category;

SELECT 
MONTH(order_date) AS month,
SUM(sales) AS revenue
FROM sales
GROUP BY month
ORDER BY month;

SELECT 
    MONTH(order_date) AS month_num, 
    SUM(sales) AS revenue
FROM sales
GROUP BY month_num
ORDER BY month_num;

SELECT 
    MONTHNAME(order_date) AS month_name, 
    SUM(sales) AS total_revenue
FROM sales
GROUP BY month_name, MONTH(order_date)
ORDER BY MONTH(order_date);