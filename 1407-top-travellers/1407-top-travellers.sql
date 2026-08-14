# Write your MySQL query statement below
SELECT DISTINCT
    u.name,
    IFNULL(
        SUM(r.distance) OVER (PARTITION BY u.id),
        0
    ) AS travelled_distance
FROM Users u
LEFT JOIN Rides r
    ON u.id = r.user_id
ORDER BY travelled_distance DESC, u.name ASC;


/*SELECT name, COALESCE(SUM(distance), 0) AS travelled_distance
FROM Users
LEFT JOIN Rides ON Users.id = Rides.user_id
GROUP BY Rides.user_id
ORDER BY travelled_distance DESC, name ASC
*/