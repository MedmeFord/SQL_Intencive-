SELECT menu.id AS menu_id FROM  menu
WHERE  NOT EXISTS
	(SELECT person_order.id FROM  person_order
	WHERE  menu.id = person_order.menu_id)
ORDER BY menu_id;