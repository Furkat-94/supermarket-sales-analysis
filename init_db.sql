-- 1. Database Setup
CREATE DATABASE IF NOT EXISTS shop_db;
USE shop_db;

-- 2. Schema Definition with optimized data types
CREATE TABLE IF NOT EXISTS sales (
    order_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(12, 2),
    quantity INT,
    total_price DECIMAL(12, 2),
    branch VARCHAR(100),
    date DATE,
    year INT
);

-- 3. DATA ANALYST QUERIES (Business Performance)

-- Sales performance by District (Branch)
SELECT 
    branch, 
    SUM(total_price) AS revenue,
    COUNT(*) AS order_count,
    ROUND(AVG(total_price), 2) AS avg_ticket
FROM sales
GROUP BY branch
ORDER BY revenue DESC;

-- Popularity by Category
SELECT 
    category, 
    SUM(total_price) AS category_revenue,
    SUM(quantity) AS units_sold
FROM sales
GROUP BY category
ORDER BY category_revenue DESC;

-- Revenue dynamics by Year
SELECT year, SUM(total_price) AS total_revenue
FROM sales
GROUP BY year
ORDER BY year;

-- Top 10 most profitable products
SELECT product_name, SUM(total_price) AS total_value
FROM sales
GROUP BY product_name
ORDER BY total_value DESC
LIMIT 10;
