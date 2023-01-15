SELECT p.name                                AS name,
       m.pizza_name                          AS pizza_name,
       m.price,
       (m.price / 100 * (100 - pd.discount)) AS discount_price,
       pi.name
from persON p
         JOIN persON_discounts pd ON p.id = pd.persON_id
         JOIN pizzeria pi ON pd.pizzeria_id = pi.id
         JOIN menu m ON pi.id = m.pizzeria_id
         JOIN persON_order po ON m.id = po.menu_id
where po.persON_id = p.id
ORDER BY 1, 2;

-- SELECT p.name                                AS name,
--        m.pizza_name                          AS pizza_name,
--        m.price,
--        (m.price / 100 * (100 - pd.discount)) AS discount_price,
--        pi.name
-- from person p
--          JOIN person_discounts pd ON p.id = pd.persON_id
--          JOIN pizzeria pi ON pd.pizzeria_id = pi.id
--          JOIN menu m ON pi.id = m.pizzeria_id
-- ORDER BY 1, 2;
