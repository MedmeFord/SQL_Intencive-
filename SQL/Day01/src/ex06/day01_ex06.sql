SELECT order_date as action_date, name FROM person_order
    JOIN person on person_order.person_id = person.id
INTERSECT
SELECT  visit_date as action_date, name FROM person_visits
    JOIN person p on person_visits.person_id = p.id
ORDER BY action_date, name DESC;