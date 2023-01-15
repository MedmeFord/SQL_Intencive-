DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
    RETURNS TABLE
            (
                person person
            )
AS
$$
SELECT *
FROM person
WHERE person.gender IN (pgender);
$$
    LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
