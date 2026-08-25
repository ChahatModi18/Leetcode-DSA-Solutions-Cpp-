# Write your MySQL query statement below
with q1 as (
select *, 
     count(*) over( order by id range between current row and 2 following ) following_cnt,
     count(*) over( order by id range between 2 preceding and current row ) preceding_cnt,
     count(*) over( order by id range between 1 preceding and 1 following ) current_cnt
from stadium
where people > 99
)
select id, visit_date, people
from q1
where following_cnt = 3 or preceding_cnt = 3 or current_cnt = 3
order by visit_date;

/*
STADIUM
   ↓
WHERE people > 99
   ↓
Only high-traffic rows
   ↓
Create 3 different windows
   ↓
┌──────────────────────────────┐
│ following_cnt                │
│ current → next 2             │
├──────────────────────────────┤
│ preceding_cnt                │
│ previous 2 → current         │
├──────────────────────────────┤
│ current_cnt                  │
│ previous → current → next    │
└──────────────────────────────┘
   ↓
Store everything in q1
   ↓
WHERE any count = 3
   ↓
Rows belonging to 3-row sequence
   ↓
ORDER BY visit_date



LOGIC:

1. First filter the Stadium table:
   WHERE people > 99
   → Keep only days having at least 100 people.

2. For every remaining row, use window functions with ORDER BY id
   to check whether it belongs to a group of 3 consecutive
   high-traffic rows.

3. following_cnt:
   RANGE BETWEEN CURRENT ROW AND 2 FOLLOWING
   → Counts the current row + next 2 rows.
   → If it is 3, the current row is the FIRST row of a valid sequence.

4. preceding_cnt:
   RANGE BETWEEN 2 PRECEDING AND CURRENT ROW
   → Counts the previous 2 rows + current row.
   → If it is 3, the current row is the LAST row of a valid sequence.

5. current_cnt:
   RANGE BETWEEN 1 PRECEDING AND 1 FOLLOWING
   → Counts previous row + current row + next row.
   → If it is 3, the current row is the MIDDLE row of a valid sequence.

6. Store these calculated counts in the CTE q1.

7. In the final query:
   following_cnt = 3 OR preceding_cnt = 3 OR current_cnt = 3
   → Keep every row that belongs to a sequence of 3 consecutive
     days with people > 99.

8. Finally, order the qualifying rows by visit_date.

        FIRST        MIDDLE        LAST

         ↓             ↓            ↓
      current       previous      previous
      + next        + current     + current
      + next        + next        + ...
*/
