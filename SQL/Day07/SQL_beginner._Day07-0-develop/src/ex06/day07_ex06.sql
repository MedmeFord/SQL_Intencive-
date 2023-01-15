SELECT pi.name,
       count(po.person_id)  AS count_of_orders,
       round(avg(price), 2) AS average_price,
       max(price)           AS max_price,
       min(price)           AS min_price
FROM pizzeria pi
         JOIN menu m on pi.id = m.pizzeria_id
         JOIN person_order po on m.id = po.menu_id
GROUP BY pi.name
ORDER BY 1;
