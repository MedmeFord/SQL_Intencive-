CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT DISTINCT piz_name FROM
	(SELECT pizzeria.name as piz_name, pizzeria_id as piz_id
	FROM person_visits
	LEFT JOIN person ON person.id = person_id
	LEFT JOIN pizzeria ON pizzeria.id = pizzeria_id
	WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08') AS t1
LEFT JOIN menu ON menu.pizzeria_id = t1.piz_id
WHERE menu.price < 800;