-- MySQL
SELECT
    c.id,
    cust_id,
    c.first_name,
    SUM(o.total_order_cost) AS sum
FROM customers c
LEFT JOIN orders o
    ON c.id = o.cust_id
GROUP BY c.id, c.first_name
HAVING SUM(o.total_order_cost) > 0
ORDER BY c.first_name

-- PostgreSQL
SELECT
    cust_id,
    first_name,
    sum(total_order_cost) AS sum
FROM customers
LEFT JOIN orders
    ON customers.id = orders.cust_id
GROUP BY cust_id, first_name
HAVING SUM(total_order_cost) > 0
ORDER BY first_name