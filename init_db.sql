-- 1. Database Setup
CREATE DATABASE IF NOT EXISTS shop_db;
USE shop_db;

-- 2. Schema Definition
CREATE TABLE IF NOT EXISTS sales (
    order_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10, 2),
    quantity INT,
    total_price DECIMAL(10, 2),
    branch VARCHAR(100),
    date DATE,
    year INT
);

-- 3. DATA ANALYST QUERIES

-- Ranking branches by total revenue (Which district sells more?)
SELECT 
    branch, 
    SUM(total_price) AS total_revenue,
    COUNT(*) AS transactions_count
FROM sales
GROUP BY branch
ORDER BY total_revenue DESC;

-- Revenue by category (Food vs Drinks)
SELECT 
    category, 
    SUM(total_price) AS revenue,
    SUM(quantity) AS units_sold
FROM sales
GROUP BY category
ORDER BY revenue DESC;

-- Top 5 most expensive transactions
SELECT order_id, product_name, total_price, branch
FROM sales
ORDER BY total_price DESC
LIMIT 5;
