# Write your MySQL query statement below
select st.student_id,st.student_name,s.subject_name, count(e.student_id) as attended_exams
from students st
cross join subjects s
left join examinations e
on st.student_id=e.student_id
and s.subject_name=e.subject_name
group by st.student_id,st.student_name,s.subject_name
order by st.student_id,st.student_name, s.subject_name ;


#GROUP BY does NOT mean sort.
#ORDER BY does NOT mean group.

/*
1. Why GROUP BY has 3 columns?
Because we want one result for every student + subject combination.
Each combination becomes one group.
Then counts exams inside each group.

ORDER BY

How should the final rows be arranged?
It first sorts by student_id.
Within the same student, sort by name ;Within the same student, sort subjects alphabetically
*/

#Our goal is to list the subjects for each student.
#cross join MEANS cartesian Product
#means :hich is like making every possible pair of rows from two tables.
/*Time to LEFT JOIN so we can show a '0' for subjects students didn't take, it will be clear later.
Each attempt at Alice's exam is displayed one after another.
And we want to count them.
*/

