# Write your MySQL query statement below
select s.user_id, round(avg(if(c.action="confirmed",1,0)),2) as confirmation_rate
from Signups as s 
left join Confirmations as c 
on s.user_id= c.user_id 
group by user_id;

#means:
# If c.action is "confirmed", give me 1; otherwise give me 0.
# It's basically like an if-else statement.

/*
AVG(
    CASE
        WHEN c.action = 'confirmed' THEN 1
        ELSE 0
    END
)
*/

