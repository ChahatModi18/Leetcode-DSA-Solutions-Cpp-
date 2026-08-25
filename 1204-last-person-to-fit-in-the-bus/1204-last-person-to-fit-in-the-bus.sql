# Write your MySQL query statement below
select q1.person_name
from queue  q1
join queue q2 
on q1.turn>=q2.turn
group by q1.TURN
having sum(q2.weight)<=1000
order by sum(q2.weight) DESC 
LIMIT 1 ; 

/*
We group the rows by turn and calculate the sum of weights for each group.
Using the HAVING clause, we filter out groups whose sum of weights exceeds the weight limit of 1000.
We order the results by the sum of weights in descending order, ensuring the last person who can fit is at the top.
Finally, we limit the result to 1 row since we only need the information of the last person.
*/