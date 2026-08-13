# Write your MySQL query statement below
SELECT P.PROJECT_ID,ROUND(AVG(E.EXPERIENCE_YEARS),2) AS AVERAGE_YEARS
FROM PROJECT P 
JOIN EMPLOYEE E
ON P.EMPLOYEE_ID=E.EMPLOYEE_ID
GROUP BY P.PROJECT_ID;


/*# Write your MySQL query statement below
SELECT p.project_id, ROUND(AVG(e.experience_years),2) AS average_years
FROM Project p 
LEFT JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY p.project_id




LEFT JOIN means:
Keep every row from Project, even if there is no matching Employee.


INNER JOIN says:
Keep only projects whose employee has a matching row in Employee.
*/
