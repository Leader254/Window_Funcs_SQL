WITH Numbers_to10 AS (
    SELECT 1 AS n
    UNION ALL
    SELECT (n + 1)
    FROM Numbers_to10
    WHERE n < 10
)
SELECT n FROM Numbers_to10;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    salary DECIMAL(10, 2),
    designation VARCHAR(100)
);

INSERT INTO employees (id, name, manager_id, salary, designation) VALUES
(1,'John Doe', NULL, 80000.00, 'CEO'),
(2,'Jane Smith', 1, 60000.00, 'Senior Manager'),
(3,'Alice Johnson', 2, 50000.00, 'Manager'),
(4,'Bob Williams', 2, 50000.00, 'Manager'),
(5,'Charlie Brown', 1, 55000.00, 'Senior Manager'),
(6,'David Lee', 3, 40000.00, 'Software Engineer'),
(7,'Emily Davis', 6, 40000.00, 'Software Engineer'),
(8,'Michael Clark', 5, 45000.00, 'Manager'), 
(9,'Sarah Wilson', 4, 45000.00, 'Manager'),
(10,'James Smith', 5, 35000.00, 'Associate');

SELECT * FROM employees;

-- Find the hierachy of employees under Emily Davis
WITH emp_hierachy AS (
    SELECT name, id, manager_id, designation, 1 AS Lvl FROM employees
    WHERE name = 'Charlie Brown'
    UNION ALL
    SELECT e.name, e.id, e.manager_id, e.designation, h.Lvl + 1
    from emp_hierachy h
    JOIN employees e on h.id = e.manager_id
)
SELECT * FROM emp_hierachy;