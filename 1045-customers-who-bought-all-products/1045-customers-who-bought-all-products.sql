# Write your MySQL query statement below
SELECT c.customer_id
FROM Customer c
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) =
       (SELECT COUNT(*) FROM Product);


       /*
       Why LEFT JOIN isn't even necessary

Notice that your query joins Customer to Product using:

ON c.product_key = p.product_key

But we don't actually need anything from Product except the total number of products.

The subquery already gives us that:

(SELECT COUNT(*) FROM Product)

So the main query can simply work with Customer.
*/