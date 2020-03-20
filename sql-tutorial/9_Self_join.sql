SELECT COUNT(*)
FROM stops;

SELECT id
FROM stops
WHERE name = 'Craiglockhart';

SELECT s.id, s.name
FROM route r
JOIN stops s on s.id = r.stop
WHERE num = '4'
and company = 'LRT';

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

SELECT a.company, a.num, a.stop, b.stop
FROM route a
JOIN route b ON a.company = b.company AND a.num = b.num
WHERE a.stop = 53
AND b.stop = 149;

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
and stopb.name = 'London Road';

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket'
and stopb.name = 'Leith'
group by 1, 2;

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name= 'Craiglockhart' 
and stopb.name = 'Tollcross'
group by 1, 2;

SELECT stopb.name, a.company, a.num
FROM route a
JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name= 'Craiglockhart';

WITH routes AS (
	SELECT a.num bus_no, a.company, a.stop a_stop, sa.name sa_name,
		   b.stop b_stop, sb.name sb_name
	FROM route a
	JOIN route b ON a.company = b.company
			     AND a.num = b.num
	JOIN stops sa ON sa.id = a.stop
	JOIN stops sb ON sb.id = b.stop
	WHERE sa.name = 'Craiglockhart' OR sb.name = 'Lochend'
)
SELECT first_bus.bus_no, first_bus.company, trans1.name, second_bus.bus_no, second_bus.company
FROM routes first_bus
JOIN stops trans1 ON first_bus.b_stop = trans1.id
JOIN routes second_bus
JOIN stops trans2 ON second_bus.a_stop = trans2.id
WHERE trans1.name = trans2.name
AND first_bus.sa_name = 'Craiglockhart'
AND second_bus.sb_name = 'Lochend'
ORDER BY 1, 2, 3, 4;
