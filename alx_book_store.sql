DROP DATABASE IF EXISTS alx_book_store;
CREATE DATABASE alx_book_store
DEFAULT CHARACTER SET = utf8mb4
DEFAULT COLLATE = utf8mb4_unicode_ci;
USE alx_book_store;

CREATE TABLE Authors (
  author_id INT NOT NULL AUTO_INCREMENT,
  author_name VARCHAR(215) NOT NULL,
  PRIMARY KEY (author_id)
);

CREATE TABLE Books (
  book_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE NOT NULL DEFAULT 0.0,
  publication_date DATE NULL,
  PRIMARY KEY (book_id),
  FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Customers (
  customer_id INT NOT NULL AUTO_INCREMENT,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215) NOT NULL,
  address TEXT,
  PRIMARY KEY (customer_id)
);

CREATE TABLE Orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Details (
  orderdetailid INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE NOT NULL DEFAULT 1.0,
  PRIMARY KEY (orderdetailid),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
