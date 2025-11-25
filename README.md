📚 Online Bookstore Management System (SQL Project)

This project is a complete SQL-based database system built using MySQL Workbench.
It demonstrates database design, relationships, data insertion, and analytical SQL queries commonly used in real-world applications.

🏗️ Project Overview

The Online Bookstore Management System manages:

Authors

Books

Customers

Orders

Order Items

The project includes:

✔ Database Schema
✔ Table Creation Scripts
✔ Sample Data Insertion
✔ Key Analytical Queries
✔ Automatically generated ER Diagram

🗂️ Database Schema (Schema Name: bookstoredb)

The project uses 5 relational tables:

1. Authors
Column	Type
AuthorID	INT (PK)
Name	VARCHAR(100)
Country	VARCHAR(50)
2. Books
Column	Type
BookID	INT (PK)
Title	VARCHAR(200)
AuthorID	INT (FK)
Genre	VARCHAR(50)
Price	DECIMAL(10,2)
Stock	INT
3. Customers
Column	Type
CustomerID	INT (PK)
Name	VARCHAR(100)
Email	VARCHAR(100)
4. Orders
Column	Type
OrderID	INT (PK)
CustomerID	INT (FK)
OrderDate	DATE
5. OrderItems
Column	Type
OrderItemID	INT (PK)
OrderID	INT (FK)
BookID	INT (FK)
Quantity	INT
🛠️ SQL Table Creation Script
CREATE DATABASE BookstoreDB;
USE BookstoreDB;

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50)
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200),
    AuthorID INT,
    Genre VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

🧪 Sample Data Insertion
INSERT INTO Authors VALUES
(1, 'Chetan Bhagat', 'India'),
(2, 'JK Rowling', 'UK'),
(3, 'Yuval Harari', 'Israel');

INSERT INTO Books VALUES
(1, 'Harry Potter', 2, 'Fantasy', 499, 50),
(2, 'Five Point Someone', 1, 'Drama', 299, 30),
(3, 'Sapiens', 3, 'History', 799, 20);

INSERT INTO Customers VALUES
(1, 'Gowtham Kumar', 'gowtham@example.com'),
(2, 'Rohith', 'rohith@example.com');

INSERT INTO Orders VALUES
(1, 1, '2025-11-01'),
(2, 2, '2025-11-05');

INSERT INTO OrderItems VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 1);

📊 Important Analytical SQL Queries
1. Total Sales
SELECT SUM(Books.Price * OrderItems.Quantity) AS TotalSales
FROM OrderItems
JOIN Books ON OrderItems.BookID = Books.BookID;

2. Best-Selling Book
SELECT Books.Title, SUM(OrderItems.Quantity) AS Sold
FROM OrderItems
JOIN Books ON OrderItems.BookID = Books.BookID
GROUP BY Books.Title
ORDER BY Sold DESC
LIMIT 1;

3. Customer Purchase History
SELECT Customers.Name, Books.Title, OrderItems.Quantity
FROM OrderItems
JOIN Orders ON OrderItems.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Books ON OrderItems.BookID = Books.BookID;

4. Low Stock Books
SELECT Title, Stock FROM Books WHERE Stock < 25;

🗺️ ER Diagram

The ERD shows all relationships:

Books → Authors (Many-to-One)

Orders → Customers (Many-to-One)

OrderItems → Orders (Many-to-One)

OrderItems → Books (Many-to-One)

You can generate it in MySQL Workbench using:
Database → Reverse Engineer

🚀 How to Run This Project

Install MySQL & MySQL Workbench

Create a new schema: BookstoreDB

Paste the table creation script

Insert sample data

Run the analytical queries

Reverse engineer the ER diagram

📌 Author

Gowtham Kumar Achari
ECE Graduate | SQL Developer | Full Stack Aspirant

🏁 Conclusion

This SQL project demonstrates:

✔ Database design
✔ Table creation
✔ SQL relationships & constraints
✔ Analytical & reporting queries
✔ ER diagram modelling
