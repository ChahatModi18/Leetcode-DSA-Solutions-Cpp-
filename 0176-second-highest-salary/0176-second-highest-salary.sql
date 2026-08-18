# Write your MySQL query statement below
select (select distinct salary as SecondHighestSalary
from employee
order by salary desc 
limit 1 offset 1 )  as SecondHighestSalary;

/*
LIMIT 1 OFFSET 1
means:
Skip 1 row, then take 1 row.



Why the outer SELECT?
Now look at:

SELECT (
    <inner query>
) AS SecondHighestSalary;

The inner query produces one value:
200
The outer query gives that value a column name:
AS SecondHighestSalary





SELECT (
    SELECT DISTINCT salary
    FROM (
        SELECT 
            salary,
            DENSE_RANK() OVER (ORDER BY salary DESC) as rnk
        FROM Employee
    ) AS RankedSalaries
    WHERE rnk = 2
) AS SecondHighestSalary;


DENSE_RANK() OVER (ORDER BY salary DESC)
orts salaries from highest to lowest and assigns a rank.
Because DENSE_RANK() gives the same rank to equal values.

RankedSalaries
----------------
salary | rnk
300    | 1
200    | 2
200    | 2
100    | 3

WHERE rnk = 2 means:
Give me only the rows whose salary has rank 2.

he outer query simply says:
Display that value with the name SecondHighestSalary.
*/