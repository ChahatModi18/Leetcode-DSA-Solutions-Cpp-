# Write your MySQL query statement below
select name
from salesperson
where sales_id not in (select o.sales_id
from orders o
join company c
on o.com_id=c.com_id
where c.name='Red')

/*select salesperson.name
from orders o join company c on (o.com_id = c.com_id and c.name = 'RED')
right join salesperson on salesperson.sales_id = o.sales_id
where o.sales_id is null*/