CREATE DATABASE AMUL_DB;
USE AMUL_DB;
CREATE TABLE Customer (CustomerID INT PRIMARY KEY,Name VARCHAR(50),City VARCHAR(50),Phone VARCHAR(15));
CREATE TABLE Product (ProductID INT PRIMARY KEY,ProductName VARCHAR(50),Category VARCHAR(30),Price DECIMAL(10,2));
CREATE TABLE Orders (OrderID INT PRIMARY KEY,CustomerID INT,OrderDate DATE,FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID));
CREATE TABLE OrderDetails (OrderDetailID INT PRIMARY KEY,OrderID INT,ProductID INT,Quantity INT,FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),FOREIGN KEY (ProductID) REFERENCES Product(ProductID));
CREATE TABLE Supplier (SupplierID INT PRIMARY KEY,SupplierName VARCHAR(50),City VARCHAR(50));
CREATE TABLE Inventory (InventoryID INT PRIMARY KEY,ProductID INT,StockQuantity INT,FOREIGN KEY (ProductID) REFERENCES Product(ProductID));
INSERT INTO Customer VALUES
(1, 'Rahul Sharma', 'Delhi', '9876543210'),
(2, 'Priya Singh', 'Mumbai', '9876543211'),
(3, 'Amit Verma', 'Lucknow', '9876543212'),
(4, 'Neha Gupta', 'Meerut', '9876543213'),
(5, 'Ravi Kumar', 'Jaipur', '9876543214'),
(6, 'Sneha Patel', 'Ahmedabad', '9876543215'),
(7, 'Arjun Mehta', 'Pune', '9876543216'),
(8, 'Kavita Joshi', 'Bhopal', '9876543217'),
(9, 'Vikas Yadav', 'Noida', '9876543218'),
(10, 'Anjali Roy', 'Kolkata', '9876543219');
INSERT INTO Product VALUES
(101, 'Amul Milk', 'Dairy', 60),
(102, 'Amul Butter', 'Dairy', 50),
(103, 'Amul Cheese', 'Dairy', 120),
(104, 'Amul Ice Cream', 'Frozen', 200);
INSERT INTO Orders VALUES
(1, 1, '2026-04-01'),
(2, 2, '2026-04-02'),
(3, 3, '2026-04-03');
INSERT INTO OrderDetails VALUES
(1, 1, 101, 2),
(2, 1, 102, 1),
(3, 2, 103, 3),
(4, 3, 104, 2);
INSERT INTO Inventory VALUES
(1, 101, 500),
(2, 102, 300),
(3, 103, 200),
(4, 104, 150);
ALTER TABLE Customer ADD Email VARCHAR(50);
ALTER TABLE Product MODIFY Price DECIMAL(12,2);
SELECT * FROM Customer;
SELECT Name, City FROM Customer;
SELECT * FROM Product WHERE Price > 100;
SELECT Customer.Name, Orders.OrderID
FROM Customer
INNER JOIN Orders ON Customer.CustomerID = Orders.CustomerID;
SELECT Customer.Name, Product.ProductName, OrderDetails.Quantity
FROM Customer
JOIN Orders ON Customer.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Product ON OrderDetails.ProductID = Product.ProductID;
SELECT Customer.Name, Orders.OrderID
FROM Customer
LEFT JOIN Orders ON Customer.CustomerID = Orders.CustomerID;








