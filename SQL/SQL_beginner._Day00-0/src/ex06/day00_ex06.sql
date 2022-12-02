SELECT
    (SELECT name FROM person as NAME WHERE NAME.id = po.person_id),
    (SELECT CASE WHEN name='Denis' THEN true ELSE false END AS check_name FROM person AS p WHERE p.id = po.person_id )
FROM person_order AS po WHERE (po.menu_id=13 OR po.menu_id=14 OR po.menu_id=18) AND po.order_date='2022-01-07';