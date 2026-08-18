CREATE FUNCTION getNthHighestSalary(N INT) 
RETURNS INT
BEGIN
SET N = N-1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT SALARY 
      FROM EMPLOYEE
      ORDER BY SALARY DESC 
      LIMIT 1 OFFSET N
  );
END


/*
means:
Remove duplicate salaries → arrange highest to lowest → skip N salaries → take the next one.

RETURN means:
Give the result of this query back as the answer of the function.

THE FUNCTION () 
It takes one input:
N
of type INT.

For example:
getNthHighestSalary(1)
means:
Give me the 1st highest salary.
And:
getNthHighestSalary(3)
means:
Give me the 3rd highest salary.

BEGIN....END : These mark the body of the function.
Everything between BEGIN and END is what the function does.

Because LIMIT ... OFFSET starts counting from 0.
Nth highest
      ↓
OFFSET N - 1
LIMIT 1 OFFSET 2

means:
Skip the first 2 salaries and take the next 1.
500  ← skip
400  ← skip
300  ← take
So we get the 3rd highest salary.
*/