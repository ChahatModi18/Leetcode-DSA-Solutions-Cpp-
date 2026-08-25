# Write your MySQL query statement below
select
DATE_FORMAT(trans_date, '%Y-%m') as month  , country, 
count(id) as trans_count, 
sum(state='approved') as approved_count,
sum(amount)as trans_total_amount, 
sum((state='approved')*amount) as approved_total_amount
from transactions 
group  by month, country ;

/*
Extract Month and Year:
Use the LEFT function to get the YYYY-MM part from the trans_date. The LEFT() function extracts a number of characters from a string (starting from left).

Count Approved Transactions:
Use SUM(state = 'approved') to count approved transactions, leveraging the fact that boolean expressions return 1 for true and 0 for false.

Sum Approved Amounts:
Use SUM((state = 'approved') * amount) to sum the transaction amounts for approved transactions, ensuring only approved amounts are summed.
*/

