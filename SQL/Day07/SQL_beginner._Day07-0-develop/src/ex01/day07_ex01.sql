SELECT p.name, count(pv.person_id) AS count_of_visits
FROM person_visits pv
         JOIN person p ON pv.person_id = p.id
GROUP BY p.name
ORDER BY 2 DESC, 1
LIMIT 4;
