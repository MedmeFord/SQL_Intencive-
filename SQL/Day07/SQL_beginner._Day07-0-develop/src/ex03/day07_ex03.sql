SELECT dd.name, sum(dd.count) AS total_count
FROM (SELECT pi.name, count(po.person_id), 'order' as action_type
      FROM person_order po
               JOIN menu m on m.id = po.menu_id
               JOIN pizzeria pi on pi.id = m.pizzeria_id
      GROUP BY pi.name
      UNION ALL
      SELECT pi.name, count(pv.person_id), 'visit' as action_type
      FROM person_visits pv
               JOIN pizzeria pi on pi.id = pv.pizzeria_id
      GROUP BY pi.name) as dd
GROUP BY dd.name
ORDER BY total_count DESC, dd.name;
