# Write your MySQL query statement below
SELECT id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id
    FROM RequestAccepted

    UNION ALL

    SELECT accepter_id AS id
    FROM RequestAccepted
) AS friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;

/*
requester_id       accepter_id
     ↓                  ↓
     └────────┬─────────┘
              ↓
             id
              ↓
        COUNT(id)

UNION ALL
Combines results vertically
Take the result above and append another query's result underneath it
as friends : The query inside (...) produces a result, and we give that result the temporary name

GROUP BY
Groups the combined IDs: so we can count each person's friends.

ORDER BY ... LIMIT 1
Instead of using MAX():
means:
Sort the largest friend count to the top and take the first row.

LOGIC FLOW :
requester_id
     +
accepter_id
     ↓
  UNION ALL
     ↓
 all people
     ↓
 GROUP BY id
     ↓
 COUNT(*)
     ↓
 number of friends
     ↓
ORDER BY num DESC
     ↓
 LIMIT 1
     ↓
 person with most friends
        */