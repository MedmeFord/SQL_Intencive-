SELECT pv.person_id, count(pv.person_id) AS count_of_visits
FROM person_visits pv
GROUP BY pv.person_id
ORDER BY count_of_visits DESC, pv.person_id;
