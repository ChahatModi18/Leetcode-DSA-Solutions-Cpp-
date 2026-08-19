# Write your MySQL query statement below
select e2.name
from employee e
join employee e2
on e.managerId = e2.id
group by e2.id, e2.name
having count(e.id)>=5;



# count(e2.id)>=5 : And yes, this condition decides which grouped manager names are returned.
#GROUP BY e.id, e.name: there is one group for John containing those 5 rows.
# e  = employee/report
# e2 = manager
/*
JOIN
 ↓
GROUP BY manager
 ↓
COUNT direct reports
 ↓
HAVING COUNT >= 5
 ↓
SELECT manager name
*/