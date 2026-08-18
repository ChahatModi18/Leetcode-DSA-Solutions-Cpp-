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
*/