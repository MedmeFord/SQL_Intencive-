SELECT p.address,
       round(max(p.age) - (min(p.age) * 1.0 / max(p.age) * 1.0), 2)                        AS formula,
       round(avg(p.age), 2)                                                                AS average,
       round(max(p.age) - (min(p.age) * 1.0 / max(p.age) * 1.0), 2) > round(avg(p.age), 2) AS comparison
FROM person p
GROUP BY p.address
ORDER BY 1;
