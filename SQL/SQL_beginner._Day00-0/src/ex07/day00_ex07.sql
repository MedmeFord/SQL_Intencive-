SELECT id, name,
    (SELECT CASE WHEN age >= 10 AND age <= 20 THEN 'interval #1'
        WHEN age > 20  AND age < 25 THEN 'interval #2' ELSE 'intrval #3' END AS interval_info)
FROM person as interval_info ORDER BY interval_info;