# Write your MySQL query statement below
SELECT P.product_name , sum(O.unit) as unit
FROM PRODUCTS P 
LEFT JOIN ORDERS O 
ON P.PRODUCT_ID=O.PRODUCT_ID
WHERE o.order_date >= '2020-02-01'
  AND o.order_date < '2020-03-01'
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;