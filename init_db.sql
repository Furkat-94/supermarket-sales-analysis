CREATE DATABASE shop_db;

USE shop_db;

CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT,
    quantity INT,
    total_price INT,
    branch VARCHAR(50),
    date DATE,
    year INT
);

SELECT product_name,SUM(price) AS total FROM sales
WHERE product_name = 'Non';

SELECT product_name, SUM(price) AS total FROM sales
GROUP BY product_name
ORDER BY total DESC; 
