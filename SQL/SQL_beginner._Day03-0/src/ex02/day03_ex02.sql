SELECT  pizza_name, price, pizzeria.name FROM
	(SELECT pizzeria_id, pizza_name, price FROM  menu
	WHERE  NOT EXISTS
	(SELECT person_order.id FROM  person_order
	WHERE  menu.id = person_order.menu_id)) AS t1
INNER JOIN pizzeria ON t1.pizzeria_id = pizzeria.id
ORDER BY 1, 2;