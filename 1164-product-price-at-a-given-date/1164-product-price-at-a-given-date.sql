# Write your MySQL query statement below
SELECT 
    p.product_id,
    COALESCE(
        (
            SELECT p2.new_price
            FROM Products p2
            WHERE p2.product_id = p.product_id
              AND p2.change_date <= '2019-08-16'
            ORDER BY p2.change_date DESC
            LIMIT 1
        ),
        10
    ) AS price
FROM (
    SELECT DISTINCT product_id
    FROM products 
) AS p;

/*
change_date <= '2019-08-16'
This means:
"Give me changes that had already happened by August 16."

Then:
ORDER BY change_date DESC
LIMIT 1
means:
"Among those changes, give me the latest one."
*/