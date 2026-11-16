SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;
#Return only 1 row from the result.
#count* is responsible to count no of orders by each customernumber