# Write your MySQL query statement below
select user_id, MAX(time_stamp) AS last_stamp
from logins 
where YEAR(time_stamp) = 2020
group by user_id;


/*
For every user_id, we need the maximum time_stamp, but only for logins that happened in 2020.
So we need:
MAX(time_stamp)



Filter to 2020 first
YEAR(time_stamp) = 2020
*/