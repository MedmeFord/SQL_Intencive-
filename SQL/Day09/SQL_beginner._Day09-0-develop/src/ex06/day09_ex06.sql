CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson VARCHAR DEFAULT 'Dmitriy',
                                                              pprice NUMERIC DEFAULT 500,
                                                              pdate DATE DEFAULT '2022-01-08')
    RETURNS table
            (
                name varchar
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT DISTINCT pi.name as name
        FROM pizzeria pi
                 JOIN menu m ON pi.id = m.pizzeria_id
                 JOIN person_visits pv ON pi.id = pv.pizzeria_id
                 JOIN person p ON pv.person_id = p.id
                 JOIN person_order po on m.id = po.menu_id
        WHERE p.name IN (pperson)
          AND pv.visit_date IN (pdate)
          AND m.price < pprice;
END;
$$
    LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');

