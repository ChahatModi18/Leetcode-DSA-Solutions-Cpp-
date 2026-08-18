# Write your MySQL query statement below
select teacher_id ,count(distinct subject_id) as cnt
from teacher
group by teacher_id;

/*
he words "for each teacher" tell you what should define your groups.
So:
GROUP BY teacher_id
creates one group for each teacher.
*/

/*
The golden rule
When using GROUP BY:
Every column in SELECT that is not inside an aggregate function generally needs to be in the GROUP BY.


"Inside each teacher's box, count the unique subjects."
That's exactly what LeetCode 2356 is asking.
So whenever you see:
"For each X, calculate/count/sum/average Y"
your first instinct should be:
GROUP BY X 
*/