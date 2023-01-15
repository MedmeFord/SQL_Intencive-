-- We run two sessions in two terminals
-- In the first session we write "BEGIN"
begin;
-- Then we make changes in the pizzeria table and set value of 'Pizza Hut' rating on '5'
update pizzeria p
set rating = 5
where p.name = 'Pizza Hut';
-- Check that we can't see the changes in the second session
select *
from pizzeria
where pizzeria.name = 'Pizza Hut';
-- The we write 'COMMIT' in the first session
commit;
-- And now we can see the changes in the second session
select *
from pizzeria
where pizzeria.name = 'Pizza Hut';
