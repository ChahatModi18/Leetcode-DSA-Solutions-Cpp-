# Write your MySQL query statement below
(SELECT name AS results
FROM MovieRating JOIN Users USING(user_id)
GROUP BY name
ORDER BY COUNT(*) DESC, name
LIMIT 1)

UNION ALL

(SELECT title AS results
FROM MovieRating JOIN Movies USING(movie_id)
WHERE EXTRACT(YEAR_MONTH FROM created_at) = 202002
GROUP BY title
ORDER BY AVG(rating) DESC, title
LIMIT 1);

/*
Why name after DESC?
You have:
ORDER BY COUNT(*) DESC, name
This means two-level sorting.
First:
COUNT(*) DESC
→ most ratings first.
If two users have the same number of ratings, then:
name
→ alphabetical order.
*/

/*
So COUNT(*) here means:
How many movie ratings did this user give?
It is not counting the rating value.


****
created_at
Suppose:
created_at = '2020-02-15 10:30:00'
This is a date/time column.
****

2. EXTRACT(YEAR_MONTH FROM created_at)
YEAR_MONTH tells MySQL:
Extract the year and month together from created_at.

So:
2020-02-15
   ↓
YEAR_MONTH
   ↓
202002

Therefore:
EXTRACT(YEAR_MONTH FROM created_at)
returns:
202002
Then = 202002
WHERE EXTRACT(YEAR_MONTH FROM created_at) = 202002
means:
Keep only rows where created_at falls in February 2020.

*/