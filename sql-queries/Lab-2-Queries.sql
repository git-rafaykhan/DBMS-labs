CREATE DATABASE DBMSLab;
GO
USE DBMSLab;
GO

CREATE TABLE city (
    CityID INT PRIMARY KEY,
    Name VARCHAR(50),
    CountryCode CHAR(3),
    District VARCHAR(50),
    Population INT
);
GO

INSERT INTO city (CityID, Name, CountryCode, District, Population)
VALUES
(1, 'Lahore', 'PAK', 'Punjab', 12188000),
(2, 'Karachi', 'PAK', 'Sindh', 14910000),
(3, 'Islamabad', 'PAK', 'Islamabad Capital', 1105000),
(4, 'Rawalpindi', 'PAK', 'Punjab', 2200000),
(5, 'Peshawar', 'PAK', 'Khyber Pakhtunkhwa', 1950000),
(6, 'Quetta', 'PAK', 'Balochistan', 1000000);
GO

CREATE TABLE country (
    CountryCode CHAR(3) PRIMARY KEY,
    Name VARCHAR(50),
    LocalName VARCHAR(50),
    GovernmentForm VARCHAR(50),
    HeadOfState VARCHAR(50),
    Capital VARCHAR(50),
    Population INT
);
GO

INSERT INTO country (CountryCode, Name, LocalName, GovernmentForm, HeadOfState, Capital, Population)
VALUES
('PAK', 'Pakistan', 'Islamic Republic of Pakistan', 'Federal Parliamentary Republic', 'Arif Alvi', 'Islamabad', 225199937);
GO

CREATE TABLE countrylanguage (
    CountryCode CHAR(3),
    Language VARCHAR(30),
    IsOfficial CHAR(1),
    Percentage FLOAT,
    FOREIGN KEY (CountryCode) REFERENCES country(CountryCode)
);
GO

INSERT INTO countrylanguage (CountryCode, Language, IsOfficial, Percentage)
VALUES
('PAK', 'Urdu', 'T', 75),
('PAK', 'English', 'T', 10),
('PAK', 'Punjabi', 'F', 45),
('PAK', 'Pashto', 'F', 30);
GO

SELECT * FROM city;
GO

SELECT * FROM country;
GO

SELECT * FROM countrylanguage;
GO

--Question no 1
SELECT * FROM city;


--Question no 2
SELECT 
    Name,
    LocalName,
    GovernmentForm,
    HeadOfState,
    Capital
FROM country;

--Question no 4

SELECT 
    Name,
    Population,
    Population * 0.10 AS TenPercentPopulation
FROM country;

--Question no 6
SELECT 
    CountryCode + ' - ' + Language AS CountryDetails
FROM countrylanguage;

