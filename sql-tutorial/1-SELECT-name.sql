SELECT name FROM world
  WHERE name LIKE 'Y%';

SELECT name FROM world
  WHERE name LIKE '%Y';

SELECT name FROM world
  WHERE name LIKE '%x%';

SELECT name FROM world
  WHERE name LIKE '%land';

SELECT name FROM world
  WHERE name LIKE 'C%ia';

SELECT name FROM world
  WHERE name LIKE '%oo%';

SELECT name FROM world
  WHERE name LIKE '%a%a%a%';

SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name;

SELECT name FROM world
 WHERE name LIKE '%o__o%';

SELECT name FROM world
 WHERE name LIKE 'Cu__';

SELECT name, capital, continent
  FROM world
 WHERE name = capital;

SELECT name, concat(name, 'town')
  FROM world
 WHERE name LIKE name || ' ' || capital;

SELECT capital, name
FROM world
WHERE capital LIKE '%' || name || '%';

SELECT *
FROM world
WHERE name LIKE name || '_%';

SELECT name, REPLACE(capital, name, '')
FROM world
WHERE name LIKE '_%' || capital;