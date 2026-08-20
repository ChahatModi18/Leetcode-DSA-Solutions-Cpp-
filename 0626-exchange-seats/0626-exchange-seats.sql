# Write your MySQL query statement below
SELECT
    CASE
        WHEN id % 2 <> 0 AND id < (SELECT MAX(id) FROM Seat)
            THEN id + 1
        WHEN id % 2 = 0
            THEN id - 1
        ELSE id
    END AS id,
    student
FROM Seat
ORDER BY id;


/*
So the key idea is: you're not actually swapping the student values; you're calculating the new ID/position each student should receive
*/