SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

SELECT *
FROM world
WHERE gdp/population > (SELECT gdp/population
FROM world
WHERE name = 'United Kingdom');

SELECT name, continent
FROM world
WHERE continent IN (SELECT continent
       FROM world
       WHERE name IN ('Argentina', 'Australia'));

SELECT name, population
FROM world
WHERE population > (SELECT population
FROM world
WHERE name = 'Canada')
AND population < (SELECT population
FROM world
WHERE name = 'Poland');

SELECT name, CONCAT(CAST(ROUND((SELECT w.population*100/population FROM world b WHERE name = 'Germany'), 0) AS CHAR), '%')
FROM world w
WHERE continent = 'Europe';

SELECT name
FROM world
WHERE gdp > ALL(SELECT gdp
FROM world
WHERE continent = 'Europe'
AND gdp > 0);

SELECT continent, name, area
FROM world x
WHERE area >= ALL
    (SELECT area
     FROM world y
     WHERE y.continent = x.continent
     AND area > 0);

SELECT continent, name
FROM world x
WHERE name = (SELECT name
FROM world y
WHERE y.continent = x.continent
LIMIT 1);

SELECT name, continent, population
FROM world x
WHERE 1 = ALL (SELECT y.population <= 25000000
FROM world y
WHERE x.continent = y.continent);

SELECT name, continent
FROM world x
WHERE x.population >= ALL( 
SELECT y.population * 3
FROM world y
WHERE y.continent = x.continent
AND y.name <> x.name);