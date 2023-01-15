SELECT p.name, count(pv.person_id) AS count_of_visits
FROM person p
         JOIN person_visits pv ON p.id = pv.person_id
GROUP BY p.name
HAVING count(pv.person_id) > 3;
