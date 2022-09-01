-- MySQL, PostgreSQL
SELECT *
FROM amazon_transactions a
JOIN amazon_transactions b
    ON a.user_id = b.user_id
    b.created_at >= a.created_at AND
    b.created_at <= a.created_at + INTERVAL '7 day'
--     b.created_at <= DATEADD(DAY, 7, a.created_at)