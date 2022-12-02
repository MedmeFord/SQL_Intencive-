SELECT (name, rating)
FROM pizzeria
AS p WHERE p.rating >= 3.5 ORDER BY p.rating;

SELECT (name, rating)
FROM pizzeria
AS p WHERE p.rating BETWEEN '3.5' AND '5.0' ORDER BY p.rating;