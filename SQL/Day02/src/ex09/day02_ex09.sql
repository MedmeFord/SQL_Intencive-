WITH table1 AS (
	SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name, person.name AS person_name
	FROM person_order
	LEFT JOIN person ON person.id = person_id
	LEFT JOIN menu ON menu.id = menu_id
	LEFT JOIN pizzeria ON pizzeria.id = pizzeria_id
	WHERE person.gender = 'female'
)
SELECT person_name
FROM table1
WHERE pizza_name = 'cheese pizza' AND person_name IN (SELECT person_name FROM table1 WHERE pizza_name = 'pepperoni pizza')
ORDER BY person_name;