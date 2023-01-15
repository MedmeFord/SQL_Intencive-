SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT m.pizza_name, p.name AS pizzeria_name
FROM pizzeria p
         JOIN menu m ON m.pizzeria_id = p.id
WHERE pizzeria_id > 0;
