import pandas as pd
import mysql.connector

# 1. Load and Analyze Data via Pandas
try:
    df = pd.read_csv("supermarket_clean.csv")
    
    print("--- DATA ANALYTICS REPORT (PANDAS) ---")
    print(f"Total Transactions: {len(df)}")
    print(f"Total Sales Revenue: {df['total_price'].sum():,.2f} UZS")
    print(f"Top Branch by Revenue: {df.groupby('branch')['total_price'].sum().idxmax()}")
    print(f"Most Sold Product: {df.groupby('product_name')['quantity'].sum().idxmax()}")
    print("--------------------------------------\n")

except FileNotFoundError:
    print("Error: supermarket_clean.csv not found!")
    exit()

# 2. Database Connection
db = mysql.connector.connect(
    host="localhost",
    user="furqat",
    password="your_password", # Replace with your password before running
    database="shop_db"
)
cursor = db.cursor()

print("Starting data migration to MySQL...")

# 3. Efficient Data Import
# We use %s placeholders to safely handle names like Go'sht and Yog'
sql_insert = """ INSERT INTO sales (order_id, product_name, category, price, quantity, total_price, branch, date, year) 
                 VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s) """

for index, row in df.iterrows():
    values = (
        int(row["order_id"]),
        str(row["product_name"]),
        str(row["category"]),
        float(row["price"]),
        int(row["quantity"]),
        float(row["total_price"]),
        str(row["branch"]),
        row["date"],
        int(row["year"])
    )
    cursor.execute(sql_insert, values)

db.commit()

print(f"Success! All {len(df)} rows have been imported to 'shop_db.sales'.")

cursor.close()
db.close()
