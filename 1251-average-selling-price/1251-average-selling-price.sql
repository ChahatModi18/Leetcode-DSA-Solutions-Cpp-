# Write your MySQL query statement below
select p.product_id, 
round(COALESCE(sum(price*units)/sum(units),0),2) as average_price
from prices p
left join unitssold u 
on p.product_id=u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
group by p.product_id;





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