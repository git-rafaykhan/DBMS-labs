
CREATE DATABASE DataDefinitionLab5;
GO


USE DataDefinitionLab5;


CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY, 
    Customer_Name VARCHAR(35) NOT NULL, 
    Customer_Address VARCHAR(35), 
    Customer_State CHAR(2) NOT NULL
);



CREATE TABLE Sales_Order (
    Order_Id INT PRIMARY KEY, 
    Order_Date DATE, 
    Customer_ID INT, 
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);



CREATE TABLE Products (
    Product_ID INT PRIMARY KEY, 
    Product_Name VARCHAR(40) UNIQUE, 
    Product_Line_ID INT CHECK (Product_Line_ID >= 10 AND Product_Line_ID <= 100)
);


CREATE TABLE Order_line (
    Order_ID INT, 
    Product_ID INT, 
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES Sales_Order(Order_Id),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);



INSERT INTO Customer (Customer_ID, Customer_Name, Customer_Address, Customer_State)
VALUES
(1, 'Ali Khan', '123 Main St', 'PK'),
(2, 'Ahmed Iqbal', '456 Elm St', 'PK'),
(3, 'Bilal Shah', '789 Oak St', 'PK'),
(4, 'Zaid Mahmood', '101 Pine St', 'PK'),
(5, 'Imran Farooq', '202 Cedar St', 'PK'),
(6, 'Omar Siddiqui', '303 Birch St', 'PK'),
(7, 'Tariq Jamil', '404 Maple St', 'PK'),
(8, 'Salman Ahmed', '505 Willow St', 'PK'),
(9, 'Usman Raza', '606 Redwood St', 'PK'),
(10, 'Farhan Yousaf', '707 Cherry St', 'PK');



INSERT INTO Sales_Order (Order_Id, Order_Date, Customer_ID)
VALUES
(1, '2023-01-01', 1),
(2, '2023-02-15', 2),
(3, '2023-03-20', 3),
(4, '2023-04-10', 4),
(5, '2023-05-05', 5),
(6, '2023-06-18', 6),
(7, '2023-07-22', 7),
(8, '2023-08-13', 8),
(9, '2023-09-14', 9),
(10, '2023-10-30', 10);



INSERT INTO Products (Product_ID, Product_Name, Product_Line_ID)
VALUES
(1, 'Laptop', 20),
(2, 'Smartphone', 30),
(3, 'Tablet', 25),
(4, 'Monitor', 40),
(5, 'Keyboard', 15),
(6, 'Mouse', 18),
(7, 'Printer', 35),
(8, 'Scanner', 22),
(9, 'Headset', 50),
(10, 'Webcam', 60);


INSERT INTO Order_line (Order_ID, Product_ID)
VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 1),
(6, 2),
(7, 3),
(7, 4),
(8, 5),
(8, 6),
(9, 7),
(9, 8),
(10, 9);


SELECT Customer_Name, Customer_Address 
FROM Customer;



SELECT Sales_Order.Order_Id, Sales_Order.Order_Date, Customer.Customer_Name
FROM Sales_Order
JOIN Customer ON Sales_Order.Customer_ID = Customer.Customer_ID;


SELECT Product_Name, Product_Line_ID
FROM Products
WHERE Product_Line_ID BETWEEN 10 AND 50;



SELECT Sales_Order.Order_Id, Products.Product_Name
FROM Order_line
JOIN Sales_Order ON Order_line.Order_ID = Sales_Order.Order_Id
JOIN Products ON Order_line.Product_ID = Products.Product_ID;

