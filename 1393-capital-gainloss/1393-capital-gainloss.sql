# Write your MySQL query statement below
SELECT stock_name, 
	   SUM(CASE WHEN operation = 'Sell' THEN price
		   ELSE -price END) AS capital_gain_loss
FROM Stocks 
GROUP BY stock_name;

/*
WINDOW FUNCTION(SUM OVER): 

SELECT DISTINCT stock_name, 
       SUM(CASE WHEN operation = 'Sell' THEN price ELSE -price END)  #is essentially creating:
Money received − Money spent
       OVER(PARTITION BY stock_name) AS capital_gain_loss
FROM Stocks


# GROUP BY stock_name
#would collapse the rows.

#Window function
#SUM(...) OVER(PARTITION BY stock_name)
#calculates the sum for each stock while keeping the individual rows.

COMMON TABLE EXPRESSIONS :
This approach is the least efficient 
WITH TotalBought AS (
    SELECT stock_name, SUM(price) AS spent
    FROM Stocks
    WHERE operation = 'Buy'
    GROUP BY stock_name
),
TotalSold AS (
    SELECT stock_name , SUM(price) AS gained
    FROM Stocks
    WHERE operation = 'Sell'
    GROUP BY stock_name
)

SELECT B.stock_name, gained - spent AS capital_gain_loss
FROM TotalBought AS B
JOIN TotalSold AS S
ON B.stock_name = S.stock_name

*/