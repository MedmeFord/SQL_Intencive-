CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

DROP INDEX idx_menu_unique;

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT pizza_name, pizzeria_id
FROM menu
WHERE pizzeria_id = 5;
