# Write your MySQL query statement below
select p.product_id, p.product_name
from product p
join sales s 
on p.product_id=s.product_id
group by p.product_id , p.product_name
HAVING MIN(s.sale_date) >= '2019-01-01'
   AND MAX(s.sale_date) <= '2019-03-31';

/*
SELECT p.product_id, p.product_name
FROM Product p
JOIN Sales s
    ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(
    CASE
        WHEN s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
        THEN 0
        ELSE 1
    END
) = 0;
SUM adds the CASE results for each product.

Let's calculate:
Product	CASE results	SUM
A	0 + 0	0
B	0 + 1	1
C	0	0

Notice:
- Product A has zero invalid sales.
- Product B has one invalid sale.
- Product C has zero invalid sales.
This is called """conditional aggregation""" because we're using a condition inside an aggregate function.


Approach	Main concept	What it checks
1	MIN + MAX	Earliest and latest dates
2	EXISTS + NOT EXISTS	At least one sale and no invalid sales
3	CASE + SUM	Zero sales outside the range

*/
