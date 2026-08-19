# Write your MySQL query statement below
select round(count(distinct player_id)/(select count(distinct player_id)from activity),2) as fraction
from activity
where (player_id, DATE_SUB(event_date,interval 1 day))
in
(select player_id, min(event_date) as first_login 
from activity 
group by player_id);


/*approach 3 
WITH FirstLogin AS (
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
),
ConsecutiveLogin AS (
    SELECT
        a.player_id
    FROM Activity a
    JOIN FirstLogin fl
    ON a.player_id = fl.player_id
    AND a.event_date = DATE_ADD(fl.first_login, INTERVAL 1 DAY)
)
SELECT
    ROUND(
        COUNT(DISTINCT cl.player_id) * 1.0 / COUNT(DISTINCT fl.player_id),
        2
    ) AS fraction
FROM FirstLogin fl
LEFT JOIN ConsecutiveLogin cl
ON fl.player_id = cl.player_id;
*/



/* approach 1 
1) We want to calculate the fraction of players who logged in again on the day after their first login. To do this, we need to count two things: the number of players who logged in on consecutive days and the total number of players.

2) To count the number of players who logged in on consecutive days, we need to find the first login date for each player and check if there is a login on the day after their first login.

3) We use a subquery to calculate the total number of distinct players in the Activity table. This gives us the denominator for calculating the fraction.

4) In the main query, we filter the rows where the player's ID and the date of the event (after subtracting 1 day) match the player's first login date. This ensures that we only consider players who logged in on consecutive days.

5) We then count the distinct player IDs in the filtered rows to get the numerator for calculating the fraction.

6) Finally, we divide the numerator by the denominator and round the result to 2 decimal places using the ROUND function.
*/

/*approach 2 :
SELECT
    ROUND(
        COUNT(DISTINCT a1.player_id) /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM Activity a1
LEFT JOIN (
    SELECT
        player_id,
        MIN(event_date) AS fd
    FROM Activity
    GROUP BY player_id
) a2
ON a1.player_id = a2.player_id
WHERE DATEDIFF(a1.event_date, a2.fd) = 1;

1)For every player, we need to determine whether they logged in again exactly one day after their first-ever login.

2)We can find the first login date of every player using MIN(event_date). Then, we join this result back with the Activity table and check whether any activity happened exactly one day after that first date.

3)The required answer is the fraction of players who performed this next-day login among all distinct players.

Approach
Find the first activity date for every player:

SELECT player_id, MIN(event_date)
FROM Activity
GROUP BY player_id
Join this result with the original Activity table using player_id.

Use:

DATEDIFF(a1.event_date, a2.fd) = 1
to identify players who logged in exactly one day after their first login.

Use COUNT(DISTINCT a1.player_id) so that a player is counted only once even if they have multiple activities on the following day.

Divide this count by the total number of distinct players.

Round the resulting fraction to two decimal places.# Write your MySQL query statement below

*/