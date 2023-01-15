-- We start two sessions
-- Write 'BEGIN' in each of them
begin;
-- Check that we are on correct isolation level
SHOW TRANSACTION ISOLATION LEVEL;
-- Then we change transaction isolation level on 'READ COMMITTED' for both sessions
set transaction isolation level read committed;
set transaction isolation level read committed;
-- Next we select sum of rating for the first session which is 21.9
select sum(rating) from pizzeria;
-- Update ration of 'Pizza Hut' in the second session on 1
update pizzeria p set rating = 1 where p.name = 'Pizza Hut'; -- for the second
-- We commit our changes for the second session;
commit;
-- Next we select sum of rating for the first session which is 19.9
select sum(rating) from pizzeria;
-- We commit our changes for the first session;
commit;
-- And write two selects to see the results
select sum(rating) from pizzeria;
select sum(rating) from pizzeria;
-- The result is 19.9 in both tables IMHO
