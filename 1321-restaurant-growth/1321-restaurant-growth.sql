# Write your MySQL query statement below
#sub query approach
SELECT
    visited_on,
    (
        SELECT SUM(amount)
        FROM customer
        WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
    ) AS amount,
    ROUND(
        (
            SELECT SUM(amount) / 7
            FROM customer
            WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
        ),
        2
    ) AS average_amount
FROM customer c
WHERE visited_on >= (
        SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
        FROM customer
    )
GROUP BY visited_on;

/* APPROACH2 
SELECT visited_on, amount, average_amount 
FROM (SELECT DISTINCT visited_on, SUM(amount)
 OVER
 (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount,
  ROUND(SUM(amount) 
  OVER 
  (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW)/7,2) AS average_amount
FROM Customer) as whole_totals
WHERE DATEDIFF(visited_on, (SELECT MIN(visited_on) FROM Customer)) >= 6


QUERY EXPLANATION🤓
SELECT visited_on, amount, average_amount
-- This selects three columns from the result of the subquery below:
-- visited_on: the date.
-- amount: the total spending from that date and the 6 previous days.
-- average_amount: the average daily spending over those 7 days

From (SELECT DISTINCT visited_on , Sum(amount)
-- DISTINCT ensures that each visited_on date appears only once in the result.
-- We begin building a result set where each row corresponds to a unique date from the Customer table.

SUM(amount) OVER (
ORDER BY visited_on
RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
) AS amount,

-- SUM(amount) OVER (...) is a window function.
-- ORDER BY visited_on means we are processing data in chronological order.
-- RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW:
-- This defines a window of 7 days: the current visited_on date and the 6 days before it.
-- So we’re summing up the amount spent by customers in the last 7 days, including today.
-- The result is named amount.

ROUND(
SUM(amount) OVER (
ORDER BY visited_on
RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
) / 7, 2
) AS average_amount

-- This is similar to the previous line, again computing the 7-day total using the same window function.
-- But this time, it divides the total by 7 to calculate the average daily amount.
-- ROUND(..., 2) rounds the result to 2 decimal places.
-- The result is named average_amount.

WHERE DATEDIFF(visited_on, (SELECT MIN(visited_on) FROM Customer)) >= 6

-- DATEDIFF(visited_on, (SELECT MIN(visited_on) FROM Customer)):
-- Calculates how many days have passed between each visited_on date and the earliest date in the table.

-- >= 6 means we only include rows from the 7th day onward.

-- Why? Because we need at least 7 days of data to calculate a full 7-day rolling window.

Code
SELECT visited_on, amount, average_amount 
FROM (SELECT DISTINCT visited_on, SUM(amount) OVER
 (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount,
  ROUND(SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW)/7,2)
   AS average_amount
FROM Customer) as whole_totals
WHERE DATEDIFF(visited_on, (SELECT MIN(visited_on) FROM Customer)) >= 6
*/