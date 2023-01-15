CREATE FUNCTION fnc_persons_female()
    RETURNS TABLE
            (
                person person
            )
AS
$$
SELECT *
FROM person
WHERE person.gender = 'female'
$$
    LANGUAGE SQL;

CREATE FUNCTION fnc_persons_male()
    RETURNS TABLE
            (
                person person
            )
AS
$$
SELECT *
FROM person
WHERE person.gender = 'male'
$$
    LANGUAGE SQL;

SELECT *
FROM fnc_persons_female();

SELECT *
FROM fnc_persons_male();
