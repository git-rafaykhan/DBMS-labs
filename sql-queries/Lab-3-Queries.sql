-- Step 1: Create a new database
CREATE DATABASE Lab3Database;
GO

-- Step 2: Switch to the newly created database
USE Lab3Database;
GO

-- Step 3: Create the country table
CREATE TABLE country (
    CountryCode CHAR(3) PRIMARY KEY, 
    Name VARCHAR(50), 
    LocalName VARCHAR(50), 
    GovernmentForm VARCHAR(50),
    HeadOfState VARCHAR(50),
    Capital VARCHAR(50),
    Population INT,
    Region VARCHAR(30),
    IndependenceYear INT,
    GrossNationalProduct DECIMAL(10, 2),
    SurfaceArea DECIMAL(10, 2) -- Adding SurfaceArea for Query 4
);
GO

-- Step 4: Create the city table
CREATE TABLE city (
    CityID INT PRIMARY KEY,
    Name VARCHAR(50),
    CountryCode CHAR(3),
    District VARCHAR(50),
    Population INT
);
GO

-- Step 5: Insert sample data into the country table
INSERT INTO country (CountryCode, Name, LocalName, GovernmentForm, HeadOfState, Capital, Population, Region, IndependenceYear, GrossNationalProduct, SurfaceArea)
VALUES
('PAK', 'Pakistan', 'Islamic Republic of Pakistan', 'Parliamentary Republic', 'Arif Alvi', 'Islamabad', 225199937, 'Asia', 1947, 4834.00, 2500),
('IND', 'India', 'Republic of India', 'Federal Republic', 'Federal system', 'New Delhi', 1380004385, 'Asia', 1947, 372.00, 1500);
GO

-- Step 6: Insert sample data into the city table
INSERT INTO city (CityID, Name, CountryCode, District, Population)
VALUES
(1, 'Karachi', 'PAK', 'Sindh', 14910000),
(2, 'Lahore', 'PAK', 'Punjab', 12188000),
(3, 'Islamabad', 'PAK', 'Islamabad Capital', 1105000),
(4, 'New York', 'USA', 'New York', 8419600),
GO

-- Now you can proceed with the queries from your lab tasks


SELECT 
    LocalName, 
    GrossNationalProduct
FROM country
WHERE GrossNationalProduct IN (372.00, 4834.00, 11705.00, 60.00, 650.00)
   OR LocalName LIKE 'B%';
GO

SELECT 
    Name, 
    Population,
    Population * 1.2 AS ExpectedPopulationIn20Years
FROM country
WHERE Population > 250000
ORDER BY Population DESC;
GO


SELECT 
    Name, 
    Capital, 
    Region, 
    IndependenceYear
FROM country
WHERE IndependenceYear = 1991
  AND Name LIKE 'A%'
  AND Capital < 500;
GO



ALTER TABLE country
ADD SurfaceArea DECIMAL(10, 2);
GO

UPDATE country
SET SurfaceArea = 2500
WHERE CountryCode = 'PAK';

UPDATE country
SET SurfaceArea = 4000
WHERE CountryCode = 'USA';

UPDATE country
SET SurfaceArea = 1500
WHERE CountryCode = 'IND';
GO


SELECT 
    SurfaceArea, 
    Population
FROM country
WHERE Population = 500000
  AND SurfaceArea BETWEEN 1000 AND 5000;
GO


SELECT 
    c.Name AS CountryName, 
    ci.Name AS CityName, 
    c.Population AS CountryPopulation,
    ci.Population AS CityPopulation,
    c.GrossNationalProduct
FROM country c
JOIN city ci ON c.CountryCode = ci.CountryCode
WHERE c.Population > 10000000
  AND ci.Population > 1000000
  AND c.GrossNationalProduct > 5000
ORDER BY c.Population DESC, ci.Population DESC;
GO