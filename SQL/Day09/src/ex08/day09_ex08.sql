CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer default 10)
    RETURNS table
            (
                number integer
            )
AS
$$
with recursive rec(n1, n2) as (
    select 0, 1
    union all
    select r.n2 as n1, r.n1 + r.n2 as n2
    from rec r
    where n2 < pstop
)
select n1
from rec
$$
    LANGUAGE sql;

select *
from fnc_fibonacci(100);

select *
from fnc_fibonacci();



