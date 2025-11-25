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


CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Customers;

INSERT INTO Books VALUES
(1, 'Harry Potter', 2, 'Fantasy', 499, 50),
(2, 'Five Point Someone', 1, 'Drama', 299, 30),
(3, 'Sapiens', 3, 'History', 799, 20);
SELECT * FROM Books;

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

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM OrderItems;

SELECT SUM(Books.Price * OrderItems.Quantity) AS TotalSales
FROM OrderItems
JOIN Books ON OrderItems.BookID = Books.BookID;

SELECT Books.Title, SUM(OrderItems.Quantity) AS Sold
FROM OrderItems
JOIN Books ON OrderItems.BookID = Books.BookID
GROUP BY Books.Title
ORDER BY Sold DESC
LIMIT 1;

SELECT Customers.Name, Books.Title, OrderItems.Quantity
FROM OrderItems
JOIN Orders ON OrderItems.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Books ON OrderItems.BookID = Books.BookID;

SELECT Title, Stock FROM Books WHERE Stock < 25;


