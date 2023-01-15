CREATE TABLE nodes
(
    id     SERIAL PRIMARY KEY,
    point1 VARCHAR,
    point2 VARCHAR,
    cost   INT
);

DROP TABLE nodes;

INSERT INTO nodes (point1, point2, cost)
VALUES ('A', 'B', 10),
       ('B', 'A', 10),
       ('A', 'C', 15),
       ('C', 'A', 15),
       ('B', 'D', 25),
       ('D', 'B', 25),
       ('B', 'C', 35),
       ('C', 'B', 35),
       ('C', 'D', 30),
       ('D', 'C', 30),
       ('A', 'D', 20),
       ('D', 'A', 20);

WITH result AS (
    SELECT two.cost + one.cost + three.cost + four.cost AS total_cost,
           lower(concat('{', one.point1, ',', one.point2, ',', two.point2, ',', three.point2, ',',
                        four.point2,
                        '}'))                           AS tour
    FROM (SELECT *
          FROM nodes
          WHERE point1 = upper('a')) AS one
             JOIN nodes two ON two.point1 = one.point2 AND one.point1 != two.point2
             JOIN nodes three ON three.point1 = two.point2 AND one.point1 != three.point2 AND two.point1 != three.point2
             JOIN nodes four ON four.point1 = three.point2 AND four.point2 = one.point1
    ORDER BY total_cost, tour),
     min_value AS (SELECT min(total_cost) AS value FROM result)
SELECT total_cost, tour
FROM result,
     min_value
WHERE total_cost = min_value.value
ORDER BY total_cost, tour;

WITH result AS (
    WITH RECURSIVE rec(tour, point1, point2, cost, total_cost, start_point) AS (
        SELECT point1 AS tour,
               point1,
               point2,
               cost,
               cost   AS total_cost,
               point1 AS start_point
        FROM nodes
        WHERE point1 = upper('a')
        UNION ALL
        SELECT concat(rec.tour, ',', n.point1) AS tour,
               n.point1,
               n.point2,
               n.cost,
               n.cost + rec.total_cost         AS total_cost,
               rec.start_point
        FROM nodes n
                 inner JOIN rec ON rec.point2 = n.point1 AND rec.point1 != n.point2
        WHERE tour not like '%' || n.point1 || '%'
    )
    SELECT distinct r1.total_cost,
                    lower(concat('{', r1.tour, ',', r1.point2, '}')) AS tour
    FROM rec r1
             JOIN rec r2 ON r1.point2 = upper(r1.start_point) AND r2.point2 = upper(r1.start_point) AND
                            length(r1.tour) > length(r2.tour)
    ORDER BY r1.total_cost),
     min_value AS (SELECT min(total_cost) AS value FROM result)
SELECT total_cost, tour
FROM result,
     min_value
WHERE total_cost = min_value.value
ORDER BY total_cost, tour;
