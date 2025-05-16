-- Step 1: Create the new database
CREATE DATABASE Lab4DB;
GO

-- Use the newly created database
USE Lab4DB;
GO

-- Step 1: Create the Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY, 
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Major VARCHAR(50),
    EnrollmentYear INT
);
GO

-- Step 2: Create the Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY, 
    CourseName VARCHAR(100),
    Credits INT,
    Department VARCHAR(50)
);
GO

-- Step 1: Insert Data into the Students Table (Pakistani male students)
INSERT INTO Students (StudentID, FirstName, LastName, Gender, DateOfBirth, Major, EnrollmentYear)
VALUES
(1, 'Ali', 'Khan', 'Male', '2000-05-15', 'Computer Science', 2018),
(2, 'Ahmed', 'Iqbal', 'Male', '1999-10-22', 'Software Engineering', 2017),
(3, 'Usman', 'Raza', 'Male', '2001-02-18', 'Computer Science', 2019),
(4, 'Bilal', 'Shah', 'Male', '2000-07-25', 'Information Technology', 2018),
(5, 'Omar', 'Siddiqui', 'Male', '1998-12-30', 'Computer Science', 2016),
(6, 'Zaid', 'Mahmood', 'Male', '1999-01-11', 'Artificial Intelligence', 2017),
(7, 'Imran', 'Farooq', 'Male', '2001-03-05', 'Computer Science', 2019),
(8, 'Tariq', 'Jamil', 'Male', '2000-11-19', 'Data Science', 2018),
(9, 'Farhan', 'Yousaf', 'Male', '1998-08-08', 'Software Engineering', 2016),
(10, 'Salman', 'Ahmed', 'Male', '2000-04-20', 'Cyber Security', 2018);
GO

-- Step 2: Insert Data into the Courses Table (Computer Science-related courses)
INSERT INTO Courses (CourseID, CourseName, Credits, Department)
VALUES
(1, 'Introduction to Programming', 3, 'Computer Science'),
(2, 'Data Structures and Algorithms', 3, 'Computer Science'),
(3, 'Database Management Systems', 3, 'Computer Science'),
(4, 'Computer Networks', 3, 'Computer Science'),
(5, 'Software Engineering', 3, 'Computer Science'),
(6, 'Operating Systems', 3, 'Computer Science'),
(7, 'Web Development', 3, 'Computer Science'),
(8, 'Artificial Intelligence', 3, 'Computer Science'),
(9, 'Machine Learning', 3, 'Computer Science'),
(10, 'Cyber Security', 3, 'Computer Science');
GO


SELECT FirstName, LastName, Major 
FROM Students;
GO

SELECT CourseName, Credits 
FROM Courses 
WHERE Department = 'Computer Science';
GO