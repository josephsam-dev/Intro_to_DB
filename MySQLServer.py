import mysql.connector
from mysql.connector import Error

try:
    # Connect to MySQL server using your root account
    connection = mysql.connector.connect(
        host='localhost',      # MySQL server is on your machine
        user='root',           # Your MySQL username
        password='Godbless321!!'  # Your MySQL password
    )

    if connection.is_connected():
        cursor = connection.cursor()
        # Create database if it doesn't exist
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

except Error as e:
    print("Error while connecting to MySQL:", e)

finally:
    # Close cursor and connection properly
    if 'cursor' in locals() and cursor:
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
