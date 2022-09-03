-- PostgreSQL
SELECT
    client_id,
    date_part('month', time_id),
    COUNT(DISTINCT user_id)
FROM fact_events
GROUP BY 1, 2