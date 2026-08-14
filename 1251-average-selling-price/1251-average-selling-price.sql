# Write your MySQL query statement below
select p.product_id, 
round(COALESCE(sum(price*units)/sum(units),0),2) as average_price
from prices p
left join unitssold u 
on p.product_id=u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
group by p.product_id;


#COALESCE(value, 0)
#means:
#If value is NULL, return 0.
#if average exists → give average
#if no matching sales → give 0
/*
You initially had:
JOIN
which passed most tests.
But the edge cases contain products with no sales, so:
INNER JOIN ❌
LEFT JOIN  ✅
And then:
LEFT JOIN
   ↓
COALESCE(..., 0)
handles the products with no sales.
*/

#Why LEFT JOIN?
#Your current:
#JOIN UnitsSold u
#is an INNER JOIN.
#It says:
#Only keep products that have a matching sale.
#But the question wants every product from Prices.



/*
SELECT
    p.product_id,
    IFNULL(ROUND(SUM(p.price * u.units) / SUM(u.units), 2), 0) AS average_price
FROM
    Prices AS p
LEFT JOIN
    UnitsSold AS u
ON
    p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
    p.product_id;
    */




#AND u.purchase_date BETWEEN p.start_date AND p.end_date
#The sale happened while that price was valid.

# Only when both on conditions  are true do we match the rows.

/*
SELECT p.product_id,
       ROUND(
           CASE
               WHEN SUM(u.units) = 0 THEN 0
               ELSE SUM(p.price * u.units) / SUM(u.units)
           END,
           2
       ) AS average_price
FROM Prices p
JOIN UnitsSold u
ON p.product_id = u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
*/


/*
most efficient code : 
# Write your MySQL query statement below
select p.product_id , COALESCE(ROUND(sum(p.price * u.units)/sum(u.units),2),0) average_price
from prices p
left join unitssold u
on p.product_id = u.product_id
where (u.purchase_date >= p.start_date and 
u.purchase_date <= p.end_date)
OR u.purchase_date is null
group by p.product_id;

-- select * from prices p 
-- left join 
-- unitssold u
-- on p.product_id = u.product_id
-- where u.purchase_date >= p.start_date and 
-- u.purchase_date < p.end_date;
*/