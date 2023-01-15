create table person_audit
(
    created    timestamp with time zone default current_timestamp not null,
    type_event char(1)                  default 'I'               not null,
    row_id     bigint                                             not null,
    name       varchar                                            not null,
    age        integer                  default 10                not null,
    gender     varchar                  default 'female'          not null,
    address    varchar,
    constraint ch_type_event check (type_event in ('I', 'U', 'D'))
);

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER
AS
$$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES ('I', new.id, new.name, new.age, new.gender, new.address);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
