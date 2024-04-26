-- Find the employees who earns the highest salary in each department
-- Create the table
CREATE TABLE Employee (
    EmployeeID INT,
    Department VARCHAR(50),
    Salary INT
);

-- Add new column
-- Alter the table to add FirstName and LastName columns
ALTER TABLE Employee
ADD FirstName VARCHAR(50);
-- ADD LastName VARCHAR(50);

SELECT * FROM [dbo].[Employee]

-- Update employee names and split them into FirstName and LastName
UPDATE Employee
SET FirstName = CASE 
                    WHEN EmployeeID = 1 THEN 'John'
                    WHEN EmployeeID = 2 THEN 'Jane'
                    WHEN EmployeeID = 3 THEN 'Michael'
                    WHEN EmployeeID = 4 THEN 'Emily'
                    WHEN EmployeeID = 5 THEN 'David'
                    WHEN EmployeeID = 6 THEN 'Sarah'
                    WHEN EmployeeID = 7 THEN 'Daniel'
                    WHEN EmployeeID = 8 THEN 'Jennifer'
                    WHEN EmployeeID = 9 THEN 'Christopher'
                    WHEN EmployeeID = 10 THEN 'Amanda'
                    WHEN EmployeeID = 11 THEN 'Matthew'
                    WHEN EmployeeID = 12 THEN 'Laura'
                END,
    LastName = CASE 
                    WHEN EmployeeID = 1 THEN 'Doe'
                    WHEN EmployeeID = 2 THEN 'Smith'
                    WHEN EmployeeID = 3 THEN 'Johnson'
                    WHEN EmployeeID = 4 THEN 'Brown'
                    WHEN EmployeeID = 5 THEN 'Wilson'
                    WHEN EmployeeID = 6 THEN 'Clark'
                    WHEN EmployeeID = 7 THEN 'Martinez'
                    WHEN EmployeeID = 8 THEN 'Taylor'
                    WHEN EmployeeID = 9 THEN 'Anderson'
                    WHEN EmployeeID = 10 THEN 'Hernandez'
                    WHEN EmployeeID = 11 THEN 'Wright'
                    WHEN EmployeeID = 12 THEN 'Perez'
                END;

-- Update EmployeeName column
UPDATE Employee
SET EmployeeName = CONCAT(FirstName, ' ', LastName);

ALTER TABLE Employee
DROP COLUMN EmployeeName;

-- Select rows from a Table or View '[Employee]' in schema '[dbo]'
SELECT * FROM [dbo].[Employee]
-- Find the employees who earns the highest salary in each department

-- Select rows from a Table or View '[Employee]' in schema '[dbo]'
SELECT * FROM Employee WHERE Salary = (SELECT MAX(Salary) from Employee);

SELECT *
FROM [dbo].[Employee] e
WHERE Salary IN (
    SELECT MAX(Salary)
    FROM [dbo].[Employee]
    WHERE Department = e.Department
);
SELECT * FROM [dbo].[Employee] e WHERE Salary in (SELECT MAX(Salary) AS Salary FROM [dbo].[Employee] WHERE Department = e.Department);

SELECT * FROM Employee AS e1 WHERE Salary =  (Select MAX(Salary) AS Salary from Employee as e2 WHERE e1.Department = e2.Department);

-- find the employees in each department who earn more than the average salary in the department.
SELECT * FROM [dbo].[Employee]
SELECT Department, AVG(Salary) as AVGSalary from Employee GROUP BY Department;
SELECT * FROM Employee e1 WHERE Salary > (SELECT AVG(Salary) as AVGSalary from Employee e2 where e2.Department = e1.Department) order by Salary ASC;



-- Stored procedures practice
-- Select rows from a Table or View '[Employee]' in schema '[dbo]'
SELECT * FROM [dbo].[Employee]