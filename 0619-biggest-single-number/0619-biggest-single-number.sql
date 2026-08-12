# Write your MySQL query statement below
SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
) AS unique_numbers;


/*
# Write your MySQL query statement below

SELECT MAX(num) as num
FROM mynumbers n
where num IN (
    SELECT num
    FROM mynumbers
    GROUP BY num
    HAVING COUNT(*)=1
)
*/



/*
Approach : Using Count and subqueries
Query1
SELECT MAX(num) AS num FROM (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(num) = 1 ) NEW;
Query2
SELECT MAX(num) AS num  FROM MyNumbers WHERE num IN (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(*) = 1);
Query3
SELECT Max(num) AS num FROM MyNumbers WHERE num NOT IN (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(num)>1);
Approach : Using Sorting
Query4
SELECT (SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(num) = 1 ORDER BY num DESC LIMIT 1) AS num;
Query5
SELECT IF(COUNT(num) =1, num, null) AS num FROM MyNumbers GROUP BY num ORDER BY COUNT(num), num DESC LIMIT 1;
Query6
SELECT COALESCE ((SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(num) = 1 ORDER BY num DESC LIMIT 1), null) AS num;
We can also use 'IFNULL' in place of 'COALESCE'
Query7
SELECT num FROM MyNumbers GROUP BY num HAVING count(num) = 1 UNION ALL SELECT NULL ORDER BY num DESC LIMIT 1;
*/