WITH max_u AS (SELECT max(c.updated) AS max, c.name from pool.public.currency c group by c.name)
SELECT coalesce(u.name, 'not defined')           AS name,
       coalesce(u.lastname, 'not defined')       AS lastname,
       b.type                                    AS type,
       sum(money)                                AS volume,
       coalesce(c.name, 'not defined')           AS currency_name,
       coalesce(c.rate_to_usd, '1')              AS last_rate_to_usd,
       sum(money) * coalesce(c.rate_to_usd, '1') AS total_volume_in_usd
FROM balance b
         FULL OUTER JOIN public."user" u ON u.id = b.user_id
         FULL OUTER JOIN (SELECT c.id, c.rate_to_usd, c.name
                          FROM pool.public.currency c
                                   JOIN max_u ON max_u.name = c.name
                          WHERE c.updated = max_u.max
                          GROUP BY c.id, c.rate_to_usd, c.name) AS c
                         ON b.currency_id = c.id
GROUP BY u.name, u.lastname, b.type, c.name, c.rate_to_usd
ORDER BY 1 DESC, 2, 3;
