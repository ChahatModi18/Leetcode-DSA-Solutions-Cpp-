# Write your MySQL query statement below
SELECT ROUND(SUM(tiv_2016), 2) tiv_2016
FROM Insurance
WHERE (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
) AND (tiv_2015) IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(tiv_2015) > 1
);

/*
unique location set
AND
repeated 2015 investment set
i.e. 
location belongs to the unique-location set
AND
2015 value belongs to the repeated-value set
THEN
sum the matching 2016 values


tiv_2015 is its total investment value in 2015;
tiv_2016 is its total investment value in 2016;
lat and lon identify the policyholder's city.

A policy contributes its tiv_2016 value only when both conditions are true:
1) Its tiv_2015 value is shared with at least one other policy.
2) Its complete (lat, lon) location is used by no other policy
i.e.
its (lat, lon) pair appears in the first subquery, so exactly one policy uses that location;
its tiv_2015 appears in the second subquery, so at least two policies share that value;
the predicates are joined by AND, so the row satisfies both task requirements.



Why (lat, lon) must be treated as a pair
This predicate uses a MySQL row constructor:

(lat, lon) IN (...)
It compares latitude and longitude as one location key. Testing lat and lon independently would be incorrect because values from different rows could be mixed.

For example:

(10, 20)
(10, 30)
(40, 20)
Latitude 10 repeats, and longitude 20 repeats, but the exact pair (10, 20) still occurs only once. Grouping and comparing the complete pair preserves that distinction.
*/