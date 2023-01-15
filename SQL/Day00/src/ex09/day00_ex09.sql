SELECT (SELECT name FROM person AS p WHERE p.id = person_id) AS person_name,
        (SELECT name FROM pizzeria AS p WHERE p.id = pizzeria_id) AS pizzeria_name
FROM (SELECT person_id, pizzeria_id FROM person_visits AS pv2 WHERE pv2.visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS pv
ORDER BY person_name, pizzeria_name DESC;
