SELECT id, title
 FROM movie
 WHERE yr = 1962;

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

SELECT id
FROM actor
WHERE name = 'Glenn Close';

SELECT id
FROM movie
WHERE title = 'Casablanca';

SELECT a.name
FROM casting c
JOIN actor a ON a.id = c.actorid
WHERE movieid = 11768;

SELECT name
FROM movie m
JOIN casting c ON c.movieid = m.id
JOIN actor a ON a.id = c.actorid
WHERE title = 'Alien';

SELECT m.title
FROM movie m
JOIN casting c ON c.movieid = m.id
JOIN actor a ON a.id = c.actorid
WHERE a.name = 'Harrison Ford';

SELECT m.title
FROM movie m
JOIN casting c ON c.movieid = m.id
JOIN actor a ON a.id = c.actorid
WHERE a.name = 'Harrison Ford'
AND c.ord <> 1;

SELECT m.title, a.name
FROM movie m
JOIN casting c ON c.movieid = m.id
JOIN actor a ON a.id = c.actorid
WHERE m.yr = 1962
AND c.ord = 1;

SELECT yr, COUNT(title)
FROM movie JOIN casting ON movie.id = movieid
           JOIN actor   ON actorid  = actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

WITH tmp AS (
 SELECT movieid
 FROM casting c
 JOIN actor a ON a.id = c.actorid
 AND a.name = 'Julie Andrews'
 GROUP BY 1
)
SELECT m.title, a.name
FROM movie m
JOIN casting c ON c.movieid = m.id
JOIN tmp t ON t.movieid = c.movieid
JOIN actor a ON a.id = c.actorid
AND c.ord = 1;

SELECT a.name
FROM casting c
JOIN actor a ON a.id = c.actorid
WHERE c.ord = 1
GROUP BY 1
HAVING COUNT(*) >= 15;

SELECT m.title, COUNT(*)
FROM movie m
JOIN casting c ON c.movieid = m.id
WHERE yr = 1978
GROUP BY 1
ORDER BY 2 DESC, 1;

WITH tmp AS (
  SELECT movieid
  FROM casting c
  JOIN actor a ON a.id = c.actorid
  WHERE a.name = 'Art Garfunkel'
)
SELECT a.name
FROM casting c
JOIN tmp t ON t.movieid = c.movieid
JOIN actor a ON a.id = c.actorid
WHERE a.name <> 'Art Garfunkel';