INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT row_number() OVER () AS id,
       p.id                 AS person_id,
       pi.id                AS pizzeria_id,
       CASE
           WHEN count(*) = 1 THEN 10.5
           WHEN count(*) = 2 THEN 22
           ELSE 30
           END              AS discount
FROM person_order po
         JOIN menu m ON m.id = po.menu_id
         JOIN pizzeria pi ON m.pizzeria_id = pi.id
         JOIN person p ON po.person_id = p.id
GROUP BY 2, 3;
