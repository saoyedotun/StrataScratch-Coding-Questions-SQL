-- MySQL, PostgreSQL
SELECT lookup.date, sum(lookup.consumption) as total_energy FROM
    (
        SELECT * FROM fb_eu_energy
        UNION ALL
        SELECT * FROM fb_asia_energy
        UNION ALL
        SELECT * FROM fb_na_energy
    )
        lookup
GROUP BY lookup.date
ORDER BY total_energy DESC
    LIMIT 1;