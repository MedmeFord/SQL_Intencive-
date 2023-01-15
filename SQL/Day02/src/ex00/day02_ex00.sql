SELECT name, rating
FROM pizzeria AS pi LEFT JOIN person_visits pv on pi.id = pv.pizzeria_id
WHERE pv.pizzeria_id IS NULL;