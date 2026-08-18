# Write your MySQL query statement below
select distinct employee_id , department_id 
from employee 
where primary_flag='y'

UNION

select employee_id, department_id 
from employee
group by employee_id
having count(employee_id)=1 ; 


/*
SELECT employee_id
 FROM Employee 
 GROUP BY employee_id 
 HAVING COUNT(*) = 1 
 gives the employee_ids of the employes who have only one occurence, meaning their corresponding department_id i the only one they belong too.

OR primary_flag = 'Y' gives the employees with stated department_ids as their primary departments

Employee 1
Has only department 1.
primary_flag = N, but it's their only department → select (1,1).

Employee 2
Has departments 1 and 2.
Multiple departments → choose the one with Y → (2,1).

Employee 3
Has only department 3 → select (3,3).

So the result is:
employee_id | department_id
------------|-------------
1           | 1
2           | 1
3           | 3

*/

# But for this problem, I would recommend the UNION solution because it directly expresses the two cases and is easier to understand.
# UNION will combine the date from both queries.

/*
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag='Y' OR 
    employee_id in
    (SELECT employee_id
    FROM Employee
    Group by employee_id
    having count(employee_id)=1)
*/