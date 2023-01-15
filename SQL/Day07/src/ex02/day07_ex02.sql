(SELECT pi.name, count(po.person_id), 'order' AS action_type
 FROM person_order po
          JOIN menu m ON m.id = po.menu_id
          JOIN pizzeria pi ON pi.id = m.pizzeria_id
 GROUP BY pi.name
 ORDER BY 3, 2 DESC
 LIMIT 3)
UNION
(SELECT pi.name, count(pv.person_id), 'visit' AS action_type
 FROM person_visits pv
          JOIN pizzeria pi ON pi.id = pv.pizzeria_id
 GROUP BY pi.name
 ORDER BY 3, 2 DESC
 LIMIT 3)
ORDER BY 3, 2 DESC;
