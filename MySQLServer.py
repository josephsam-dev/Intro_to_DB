#!/usr/bin/env python3
import sys
import mysql.connector
from mysql.connector import Error

def create_database(user, password, host='localhost'):
    try:
        connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password
        )
        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print("Error while connecting to MySQL:", e)

    finally:
        if 'cursor' in locals() and cursor:
            cursor.close()
        if 'connection' in locals() and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python MySQLServer.py <mysql_password> [mysql_user] [host]")
        sys.exit(1)

    mysql_password = sys.argv[1]
    mysql_user = sys.argv[2] if len(sys.argv) >= 3 else "root"
    mysql_host = sys.argv[3] if len(sys.argv) >= 4 else "localhost"

    create_database(mysql_user, mysql_password, host=mysql_host)
