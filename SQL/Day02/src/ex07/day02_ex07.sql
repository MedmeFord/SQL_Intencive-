-- SELECT name AS pizzeria_name
SELECT pizzeria.name
FROM pizzeria
         JOIN menu ON pizzeria.id = menu.pizzeria_id
         JOIN person_visits pv on pizzeria.id = pv.pizzeria_id
         JOIN person ON pv.person_id = person.id
WHERE person.name = 'Dmitriy'
  AND pv.visit_date = '2022-01-08'
  and menu.price < 800;
