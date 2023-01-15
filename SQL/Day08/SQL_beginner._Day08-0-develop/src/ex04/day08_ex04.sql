-- We start two sessions
-- Write 'BEGIN' in each of them
begin;
-- Check that we are on correct isolation level
SHOW TRANSACTION ISOLATION LEVEL;
-- Then we change transaction isolation level on 'READ COMMITTED' for both sessions
set transaction isolation level serializable;
set transaction isolation level serializable;
-- Update ration of 'Pizzat Hut' in the second session on 3.6
update pizzeria p set rating = 3 where p.name = 'Pizza Hut'; -- for the second
-- We commit our changes for the second session;
commit;
-- And then write select for the first session where result is still 3.6
select * from pizzeria;
-- We commit our changes for the first session;
commit;
-- And write two selects to see the results
select * from pizzeria;
select * from pizzeria;
-- The result is 3.6 in both tables IMHO
