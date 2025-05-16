CREATE DATABASE DataDefinitionLab6;
GO

USE DataDefinitionLab6;
GO

CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    Employee_FirstName VARCHAR(50),
    Employee_LastName VARCHAR(50),
    Job VARCHAR(50),
    Employee_Email VARCHAR(100)
);
GO

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_FirstName VARCHAR(50),
    Customer_LastName VARCHAR(50),
    Customer_Address VARCHAR(100),
    Customer_State CHAR(2),
    Customer_CreditLimit DECIMAL(10, 2),
    Customer_Email VARCHAR(100)
);
GO

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Customer_ID INT,
    Order_Price DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
GO

INSERT INTO Employee (Employee_ID, Employee_FirstName, Employee_LastName, Job, Employee_Email)
VALUES 
(1001, 'Ahmed', 'Khan', 'Manager', 'ahmed.khan@email.com'),
(1002, 'Ali', 'Raza', 'President', 'ali.raza@email.com'),
(1003, 'Sohail', 'Ahmed', 'Developer', 'sohail.ahmed@email.com');
GO

INSERT INTO Customer (Customer_ID, Customer_FirstName, Customer_LastName, Customer_Address, Customer_State, Customer_CreditLimit, Customer_Email)
VALUES 
(1, 'Zain', 'Khan', '123 Lahore St', 'PB', 15000.00, 'zain.khan@email.com'),
(2, 'Muneeb', 'Ali', '456 Karachi Ave', 'SD', 5000.00, 'muneeb.ali@email.com'),
(3, 'Faisal', 'Iqbal', '789 Rawalpindi Rd', 'IS', 20000.00, 'faisal.iqbal@email.com');
GO

INSERT INTO Orders (Order_ID, Order_Date, Customer_ID, Order_Price)
VALUES 
(10100, '2025-05-10', 1, 250.00),
(10101, '2025-05-12', 2, 100.00),
(10102, '2025-05-14', 3, 150.00);
GO

SELECT 
    CONCAT(Employee_FirstName, ' ', Employee_LastName, ' ', Job) AS Full_Job_Title,
    LEN(Employee_Email) AS Email_Length,
    CHARINDEX('A', Employee_LastName) AS Position_Of_A
FROM 
    Employee
WHERE 
    Employee_ID = 1002 AND Job = 'President';
GO

SELECT 
    Customer_LastName
FROM 
    Customer
WHERE 
    Customer_FirstName LIKE '%p%' 
    AND SUBSTRING(Customer_LastName, 5, 1) = 'A';
GO

SELECT 
    CONCAT(UPPER(LTRIM(RTRIM(Customer_FirstName))), ' ', LTRIM(RTRIM(Customer_LastName))) AS FullName,
    REPLACE(Customer_Address, 'St', 'Street') AS Address,
    SUBSTRING(Customer_Email, 1, 5) AS Email_Part,
    CHARINDEX('p', Customer_FirstName) AS Position_Of_P,
    RIGHT(REPLICATE('Rs', 15) + CONVERT(VARCHAR, Customer_CreditLimit), 15) AS Padded_CreditLimit
FROM 
    Customer
WHERE 
    Customer_LastName LIKE 'S%' 
    AND LEN(Customer_Email) > 15;
GO

SELECT 
    RIGHT(REPLICATE('Rs', 15) + CONVERT(VARCHAR, Customer_CreditLimit), 15) AS Credit_Balance
FROM 
    Customer
WHERE 
    Customer_LastName = 'Khan' 
    AND Customer_CreditLimit > 10000;
GO

SELECT 
    Order_ID,
    ROUND(Order_Price, 2) AS Rounded_Price
FROM 
    Orders
WHERE 
    Order_ID = 10100;
GO
