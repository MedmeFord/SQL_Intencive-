SELECT person.name, menu.pizza_name, pizzeria.name FROM person_order
JOIN menu ON person_order.menu_id = menu.id JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person ON person_order.person_id = person.id ORDER BY person.name, pizza_name, pizzeria.name;