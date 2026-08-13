# Write your MySQL query statement below
# Find the number of unique active users for each day during the 30-day period ending on 2019-07-27.

select activity_date as day,
count(distinct user_id) as active_users 
from activity
where date_sub('2019-07-27',interval 30 day) < activity_date
and activity_date<='2019-07-27'
group by activity_date;


# where date_sub('2019-07-27',interval 30 day) < activity_date 
# MEANS
# activity_date must be greater than 30 days before July 27.


/*
SELECT activity_date AS day,
       COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date > '2019-06-27'
  AND activity_date <= '2019-07-27'
GROUP BY activity_date;
*/



/*
SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE '2019-06-28' AND DATE '2019-07-27'
GROUP BY activity_date;
*/



/*
SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;
*/