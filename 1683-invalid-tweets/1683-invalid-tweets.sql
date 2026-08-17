# Write your MySQL query statement below
SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;





/*Modified Solution:
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) - LENGTH(REPLACE(content, ' ', '')) + 1 > 2;
LENGTH(content): This returns the total length of the content
REPLACE(content, ' ', ''): This removes all spaces from the content.
LENGTH(content) - LENGTH(REPLACE(content, ' ', '')): This calculates the number of spaces in the content
Adding 1 to the number of spaces gives the number of words.
The condition LENGTH(content) - LENGTH(REPLACE(content, ' ', '')) + 1 > 2 checks if the number of words is greater than 2.
*/