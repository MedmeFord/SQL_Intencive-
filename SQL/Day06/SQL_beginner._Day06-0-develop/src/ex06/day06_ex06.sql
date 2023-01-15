DROP SEQUENCE IF EXISTS seq_person_discounts CASCADE;

CREATE SEQUENCE seq_person_discounts START WITH 1;
SELECT setval('seq_person_discounts', (SELECT max(id) FROM person_discounts));
ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

INSERT INTO person_discounts (person_id, pizzeria_id, discount)
values (4, 4, 12);


-- CREATE SEQUENCE seq_person_discounts START WITH 1;
-- SELECT setval('seq_person_discounts', (SELECT count(*) + 1 FROM person_discounts));
-- ALTER TABLE person_discounts
--     ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');
--
-- INSERT INTO person_discounts (person_id, pizzeria_id, discount)
-- values (3, 3, 12);
