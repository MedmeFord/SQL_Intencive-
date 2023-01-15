SELECT p.address, pi.name, count(po.person_id) AS count_of_orders
FROM person p
         JOIN person_order po ON p.id = po.person_id
         JOIN menu m ON po.menu_id = m.id
         JOIN pizzeria pi ON m.pizzeria_id = pi.id
GROUP BY p.address, pi.name
ORDER BY 1, 2;
