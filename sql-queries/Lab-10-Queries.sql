
DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
    eid INTEGER PRIMARY KEY,
    name VARCHAR(100),
    salary INTEGER,
    department VARCHAR(50),
    date_joined DATE,
    office_code VARCHAR(10)
);

-- Step 2: Insert Employee Data
INSERT INTO employee (eid, name, salary, department, date_joined, office_code) VALUES
(1, 'Raj Patel', 60000, 'Executive', '2020-11-01', 'PUN'),
(2, 'Radhika Sharma', 80000, 'Operations', '2019-02-12', 'MUM'),
(3, 'Shreya Kulkarni', 55000, 'Human Resources', '2018-05-30', 'PUN'),
(4, 'Vinay Jagdale', 75000, 'Operations', '2020-01-03', 'PUN'),
(5, 'Jay Maini', 75000, 'Marketing', '2020-08-17', 'MUM'),
(6, 'Vinisha Subramaniam', 90000, 'Executive', '2018-04-05', 'CHE'),
(7, 'Ritwik Pawar', 90000, 'Executive', '2018-04-05', 'CHE'),
(8, 'Arun Banerjee', 85000, 'Marketing', '2018-04-05', 'KOL'),
(10, 'Devesh Panchal', 70000, 'Operations', '2018-04-05', 'PUN');

-- Step 3: Query - Count and Sum for Executive Department
SELECT 
    COUNT(*) AS executive_count,
    SUM(salary) AS executive_total_salary
FROM 
    employee
WHERE 
    department = 'Executive';

-- Step 4: Query - Min and Max Salary in the Table
SELECT 
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM 
    employee;
