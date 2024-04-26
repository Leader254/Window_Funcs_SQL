create table employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);
SELECT * FROM employee;


-- ROW_NUMBER(): Assigns a unique sequential integer to each row within a partition based on specified criteria.
SELECT * FROM (
SELECT 
    e.*,
    ROW_NUMBER() OVER (PARTITION BY Dept_name ORDER BY salary desc) AS RowNum
FROM employee e
)as SubQuery
WHERE RowNum = 1;

-- RANK(): Assigns a unique rank to each row within a partition based on specified criteria, skipping ranks in case of ties.
SELECT * FROM (
    SELECT 
        e.*,
        RANK() OVER (PARTITION BY Dept_name ORDER BY salary desc) AS RankNum
    FROM employee e
) as SubQuery
WHERE RankNum = 1;

-- DENSE_RANK(): Assigns a unique rank to each row within a partition based on specified criteria, without skipping ranks in case of ties.
SELECT * FROM (
    SELECT 
        e.*,
        DENSE_RANK() OVER (PARTITION BY Dept_name ORDER BY salary desc) AS RankNum
    FROM employee e
) as SubQuery
WHERE RankNum = 1;

-- MAX() in subquery: Retrieves the maximum value from a column in a subquery based on specified conditions.
SELECT * FROM employee e1
WHERE salary = (
    SELECT MAX(salary)
    from employee e2
    where e1.DEPT_NAME = e2.DEPT_NAME
)