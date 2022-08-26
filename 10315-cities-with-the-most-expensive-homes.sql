-- MySQL, PostgreSQL
SELECT city
FROM zillow_transactions
GROUP BY city
HAVING AVG(mkt_price) >
       (SELECT AVG(mkt_price)
        FROM zillow_transactions);