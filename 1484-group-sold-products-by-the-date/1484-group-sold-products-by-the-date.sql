# Write your MySQL query statement below
select sell_date, count(distinct product) as num_sold,
GROUP_CONCAT( DISTINCT product order by product ASC separator ',' ) as products
from activities
group by sell_date
order by sell_date ;

/*
Without GROUP_CONCAT:
Headphone
Keyboard
Mouse

With:
GROUP_CONCAT(product)
you get:
Headphone,Keyboard,Mouse

So:
GROUP_CONCAT = combine multiple rows into one value.

Without DISTINCT:
GROUP_CONCAT(product)
→ Keyboard,Mouse,Keyboard

With:
GROUP_CONCAT(DISTINCT product)
→ Keyboard,Mouse

So:
DISTINCT removes duplicate products
*/