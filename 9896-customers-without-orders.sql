-- MySQL, PostgreSQL
SELECT first_name
FROM customers
WHERE id NOT IN (
    SELECT DISTINCT cust_id FROM orders
)