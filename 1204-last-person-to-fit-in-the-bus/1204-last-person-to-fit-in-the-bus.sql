# Write your MySQL query statement below
select q1.person_name
from queue  q1
join queue q2 
on q1.turn >=q2.turn
group by q1.TURN
having sum(q2.weight)<=1000
order by sum(q2.weight) DESC 
LIMIT 1 ; 

/*

Queue
  │
  ├──────────> q1 = "the person I'm currently checking"
  │
  └──────────> q2 = "people before/current to that person"

They are aliases, not two different tables.

SUM(q2.weight): gives the total weight of everyone up to that person's turn.

9. Why ORDER BY SUM(q2.weight) DESC?
Now we have:
Alice   → 300
Bob     → 700
Charlie → 950
We want the last person who can fit.
So we sort the cumulative weight from highest to lowest:
950
700
300
Therefore:
ORDER BY SUM(q2.weight) DESC
puts Charlie first.


We group the rows by turn and calculate the sum of weights for each group.
Using the HAVING clause, we filter out groups whose sum of weights exceeds the weight limit of 1000.
We order the results by the sum of weights in descending order, ensuring the last person who can fit is at the top.
Finally, we limit the result to 1 row since we only need the information of the last person.


LOGICAL FLOW :t he easiest way to remember this query

Think:
q1 = "WHO AM I CHECKING?"
q2 = "WHO CAME BEFORE/UP TO ME?"
Then:

ON q1.turn >= q2.turn
↓
Find everyone up to q1

GROUP BY q1.turn
↓
Make one group for each candidate

SUM(q2.weight)
↓
Calculate total weight up to that candidate

HAVING SUM(q2.weight) <= 1000
↓
Remove people who make the bus exceed capacity

ORDER BY SUM(q2.weight) DESC
↓
Find the candidate with the largest valid cumulative weight

LIMIT 1
↓
Return that person's name
*/