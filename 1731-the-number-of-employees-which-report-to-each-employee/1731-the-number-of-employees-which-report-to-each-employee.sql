# Write your MySQL query statement below
select e2.employee_id, e2.name, 
count(e1.reports_to) as reports_count,
round(avg(e1.age)) as average_age 
from employees e1
join employees e2
on e1.reports_to=e2.employee_id
group by e2.employee_id, e2.name
order by employee_id ;



# The question asks us to output:
#so , in select  statement e2.column name 
# the employee who has people reporting to them
# That is the manager.