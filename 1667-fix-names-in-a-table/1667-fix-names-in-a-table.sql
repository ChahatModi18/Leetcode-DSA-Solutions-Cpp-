# Write your MySQL query statement below
SELECT
    user_id,
    CONCAT(
        UPPER(LEFT(name, 1)),
        LOWER(SUBSTRING(name, 2))
    ) AS name
FROM Users
ORDER BY user_id;


/*
SELECT Users.user_id , CONCAT(UPPER(SUBSTR(Users.name,1,1)),LOWER(SUBSTR(Users.name,2))) AS name 
FROM Users
ORDER BY
Users.user_id ASC





string manipulation functions:

Use LEFT(name, 1) to extract the first character
Apply UPPER() to capitalize the first character
Use SUBSTRING(name, 2) to get everything after the first character
Apply LOWER() to lowercase the remaining characters
Use CONCAT() to combine the uppercased first character with the lowercased rest
Alias the result as 'name' to match the expected output
ORDER BY user_id to sort the results
*/