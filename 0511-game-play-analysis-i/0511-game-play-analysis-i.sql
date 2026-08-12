SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;
#without GROUP BY would give one minimum date for the entire table.