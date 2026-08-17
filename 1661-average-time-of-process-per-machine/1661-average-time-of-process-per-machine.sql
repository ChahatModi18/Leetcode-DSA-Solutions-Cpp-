# Write your MySQL query statement below
select a1.machine_id, round(avg(a2.timestamp-a1.timestamp),3) as processing_time
from activity a1
join activity a2
on a1.machine_id=a2.machine_id and a1.process_id=a2.process_id
and a1.activity_type='start' and a2.activity_type='end'
group by a1.machine_id
order by a1.machine_id asc;




/*
******** 
This is a classic SELF JOIN pattern for matching two different rows belonging to the same entity. 

********
SELF JOIN ≠ a different type of JOIN.
It's simply joining a table to itself. Here, JOIN is still an INNER JOIN.

on condition : Match rows belonging to the same machine AND same process.
END time − START time = processing time

But putting them in ON makes the join logic very clear:
Join the same machine/process where one is start and the other is end.


The entire query in one flow : 
Activity a1                 Activity a2
    ↓                           ↓
START rows                   END rows
    ↓                           ↓
       Same machine + process
                  ↓
          SELF JOIN
                  ↓
       END - START
                  ↓
        Processing time
                  ↓
       GROUP BY machine
                  ↓
            AVG()
                  ↓
           ROUND(...,3)
                  ↓
          ORDER BY machine

*/