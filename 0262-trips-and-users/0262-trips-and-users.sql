# Write your MySQL query statement below
SELECT 
    request_at AS Day, 
    ROUND(SUM(
            CASE 
                WHEN status = 'cancelled_by_driver' OR status = 'cancelled_by_client'
                THEN 1 ELSE 0
            END
        ) / COUNT(request_at), 2) AS "Cancellation Rate"
FROM Trips t
JOIN Users u
    ON t.client_id = u.users_id
    AND u.banned = 'No'
JOIN Users us
    ON t.driver_id = us.users_id
    AND us.banned = 'No'
WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at;

/*
SUM(CASE WHEN status = 'cancelled_by_driver' OR status = 'cancelled_by_client' THEN 1 ELSE 0 END)
MEANS : It converts each cancelled trip to 1, every non-cancelled trip to 0, and SUM() counts the total number of cancelled trips. It checks each row/trip individually.



Because the same Users table contains two different types of users involved in each trip:
client_id → needs the client's information
driver_id → needs the driver's information
So we need to look at the Users table twice, using two different aliases.
*/