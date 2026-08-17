# Write your MySQL query statement below
select u.name , sum(t.amount) as balance 
from users u 
left join transactions t
on u.account=t.account
GROUP BY u.account, u.name
HAVING SUM(t.amount) > 10000;