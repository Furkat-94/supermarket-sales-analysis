# Supermarket Sales Analysis 🛒

A project for automating sales data processing: loading data from CSV into a MySQL database followed by SQL analytics.

## 🛠 Tech Stack
* **Python** (`pandas` library for data manipulation)
* **MySQL** (data storage and analytical queries)
* **mysql-connector-python** (integration between Python and MySQL)

## 📋 Project Overview
1. **DB Schema (`init_db.sql`)**: A SQL script that sets up the `shop_db` database and the `sales` table with optimized data types.
2. **ETL Pipeline (`main.py`)**: A Python script that reads the cleaned CSV file and automatically imports each row into the MySQL database.
3. **Analytics**: Pre-written SQL queries to analyze revenue by product and category.

## 🚀 How to Run
1. Run the script in `init_db.sql` using your MySQL console to create the database and table.
2. Install the required dependencies:
   ```bash
   pip install pandas mysql-connector-python
   ```
3. Update the database credentials in `main.py` and run the script to import data from `supermarket_clean.csv`.

## 📊 Analytical Query Examples
The project includes SQL queries for:
* Calculating total revenue for specific products.
* Grouping and sorting products by sales volume to identify top performers.
