# Write your MySQL query statement below
SELECT d.name AS Department,
       e.name AS Employee,
       e.salary AS Salary
FROM Employee e
JOIN Department d
    ON e.departmentId = d.id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM Employee e2
    WHERE e2.departmentId = e.departmentId
);  

/*
SELECT Department, Employee, Salary
FROM (
    SELECT d.name AS Department,
           e.name AS Employee,
           e.salary AS Salary,
           DENSE_RANK() OVER (
               PARTITION BY e.departmentId
               ORDER BY e.salary DESC
           ) AS rnk
    FROM Employee e
    JOIN Department d
        ON e.departmentId = d.id
) t
WHERE rnk = 1;


DENSE_RANK() OVER (
    PARTITION BY departmentId
    ORDER BY salary DESC
)
→ restart the ranking for every department.
key new concept: PARTITION BY = make separate groups for the window function without collapsing the rows like GROUP BY does.
*/

# e2 = all employees being checked for comparison