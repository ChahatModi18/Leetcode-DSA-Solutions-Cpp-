# Write your MySQL query statement below
WITH new_table AS (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (
            PARTITION BY d.name
            ORDER BY e.salary DESC
        ) AS Ranking
    FROM Employee e
    LEFT JOIN Department d
        ON e.departmentId = d.id
)
SELECT
    Department,
    Employee,
    Salary
FROM new_table
WHERE Ranking <= 3;

/*
PARTITION BY creates separate groups/windows for the calculation, 
but unlike 
GROUP BY, it does NOT collapse the rows.

DENSE_RANK() OVER (
    PARTITION BY d.name
    ORDER BY e.salary DESC
)

There are two instructions here:
PARTITION BY d.name
        ↓
Separate employees department-wise

ORDER BY e.salary DESC
        ↓
Rank employees from highest salary to lowest

So we're saying:
Rank employees separately inside each department.

             Employees
                 │
       ┌─────────┴─────────┐
       ↓                   ↓
      IT                   HR
       │                   │
 Joe  90000            Amy  95000
 Jim  85000            Bob  90000
 Sam  85000            Tim  80000
 Max  70000
*/