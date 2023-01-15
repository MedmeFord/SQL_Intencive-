set enable_seqscan = off;
create unique index idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

EXPLAIN ANALYZE
select p.name                                as name,
       m.pizza_name                          as pizza_name,
       m.price,
       (m.price / 100 * (100 - pd.discount)) as discount_price,
       pi.name
from person p
         join person_discounts pd on p.id = pd.person_id
         join pizzeria pi on pd.pizzeria_id = pi.id
         join menu m on pi.id = m.pizzeria_id
order by 1, 2;