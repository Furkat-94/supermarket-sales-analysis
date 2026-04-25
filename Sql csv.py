import pandas as pd
import mysql.connector


data = pd.read_csv("supermarket_clean.csv")
df = pd.DataFrame(data)

db = mysql.connector.connect(
    host="localhost",
    user="furqat",
    password="phoenix94",
    database="shop_db"
)

cursor = db.cursor()

for index, row in df.iterrows():
    sql = """ INSERT INTO sales(order_id,product_name,category,price,quantity,total_price,branch,date,year) 
              VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"""

    values = (
        row["order_id"],
        row["product_name"],
        row["category"],
        row["price"],
        row["quantity"],
        row["total_price"],
        row["branch"],
        row["date"],
        row["year"],
    )

    cursor.execute(sql, values)

db.commit()
cursor.close()
db.close()
print("Successful")