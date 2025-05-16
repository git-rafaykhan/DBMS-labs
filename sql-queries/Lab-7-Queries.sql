CREATE DATABASE Lab7DB;


USE Lab7DB;


CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Order_Price DECIMAL(10, 2),
    Order_Date DATE,
    Ship_Date DATE
);


INSERT INTO Orders (Order_ID, Order_Price, Order_Date, Ship_Date)
VALUES 
(10100, 500.75, '2025-05-01', '2025-05-03'),
(10101, 750.50, '2025-05-02', '2025-05-05'),
(10102, 300.30, '2025-05-10', '2025-05-12');


SELECT 
    Order_ID,
    ROUND(Order_Price, 2) AS Rounded_Price
FROM 
    Orders
WHERE 
    Order_ID = 10100;


SELECT 
    Order_ID,
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    DAY(Order_Date) AS Order_Day
FROM 
    Orders;


SELECT 
    Order_ID,
    DATENAME(WEEKDAY, Order_Date) AS Day_Of_Week
FROM 
    Orders;


SELECT 
    Order_ID,
    DATEDIFF(DAY, Order_Date, Ship_Date) AS Days_Between_Order_Shipment
FROM 
    Orders
WHERE 
    Order_ID = 10100;


SELECT 
    DATEDIFF(MINUTE, '08:00', '10:30') AS Time_Difference_in_Minutes;



SELECT 
    GETDATE() AS Current_System_Date;

