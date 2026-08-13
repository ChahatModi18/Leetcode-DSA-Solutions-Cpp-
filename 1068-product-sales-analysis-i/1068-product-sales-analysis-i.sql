# Write your MySQL query statement below
SELECT P.PRODUCT_NAME,S.YEAR,S.PRICE
FROM SALES S
JOIN PRODUCT P
ON P.PRODUCT_ID=S.PRODUCT_ID;


/*For an INNER JOIN, these two are effectively equivalent: WHERE , 
ON BECAUSE :
INNER JOIN already keeps only matching rows, so the final result is the same.
FOR LEFT JOIN , THIS CHANGES BECAUSE IN LEFT JOIN Keep ALL Product rows.
*/



/*
SELECT P.PRODUCT_NAME,S.YEAR,S.PRICE
FROM SALES S
JOIN PRODUCT P
WHERE P.PRODUCT_ID=S.PRODUCT_ID;
*/