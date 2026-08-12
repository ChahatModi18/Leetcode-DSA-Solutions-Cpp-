# Write your MySQL query statement below
SELECT x,y,z,
case WHEN (x+y) > z AND (x+z) > y AND (y+z) > x THEN 'Yes' ELSE 'No' end AS triangle
FROM Triangle ;


/*# Write your MySQL query statement below
select x, y, z, 
if(x+y>z and x+z>y and y+z>x, 'Yes', 'No' ) as triangle
from Triangle



CASE is basically SQL's if-else. */