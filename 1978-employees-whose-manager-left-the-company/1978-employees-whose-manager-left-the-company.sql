
SELECT employee_id
FROM Employees
WHERE salary < 30000
  AND manager_id IS NOT NULL
  AND manager_id NOT IN (
      SELECT employee_id
      FROM Employees
  )
ORDER BY employee_id;




/*
SELECT employee_id
FROM Employees
WHERE salary < 30000
  AND manager_id NOT IN (
      SELECT employee_id
      FROM Employees
  )
ORDER BY employee_id;
*/


/*
This asks:
Is this employee's manager_id NOT present among the current employees?
For example:

employee_id	salary	manager_id
1	50000	NULL
2	25000	1
3	20000	5
4	40000	1

If employee 5 doesn't exist in Employees, then employee 3 has a manager who has left.
Employee 3 satisfies:
20,000 < 30,000  ✅
manager 5 doesn't exist  ✅
ou wrote:

GROUP BY employee_id
But we're not using COUNT(), MAX(), MIN(), SUM(), etc.
Each employee already has one row, so GROUP BY isn't needed.

one more important condition
The problem also excludes employees whose manager_id IS NULL (they have no manager).
*/