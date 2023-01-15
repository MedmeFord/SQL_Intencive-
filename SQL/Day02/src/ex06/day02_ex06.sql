SELECT menu.pizza_name as pizza_name,pizzeria.name as pizzeria_name
FROM (SELECT id FROM person WHERE id = person.id and person.name = 'Denis' or person.name = 'Anna') as person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id ORDER BY 1,2
