# Write your MySQL query statement below
select product_id, year as first_year, quantity, price 
from sales where (product_id, year) in (
    select product_id, min(year)
    from sales
    group by product_id
)

/*
# Write your MySQL query statement below

WITH CTE AS (
    SELECT product_id, MIN(year) AS minyear 
    FROM Sales 
    GROUP BY product_id 
)
SELECT s.product_id, s.year AS first_year, s.quantity, s.price 
FROM Sales s
INNER JOIN CTE
 ON cte.product_id = s.product_id  
 AND 
 s.year = cte.minyear; 

explanation
CTE as a temporary result table:

explannation of 1st approach :

WHERE (product_id, year) IN (...)
This is a pair/row comparison.
It essentially says:
Keep the row if its (product_id, year) pair exists in the result of the subquery.

*/