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

SELECT origin.num, origin.company, s.name, destiny.num, destiny.company
FROM (
  SELECT num, company, pos, stop
  FROM route r
  WHERE stop < 147
  AND stop > pos) origin
JOIN (
  SELECT num, company, pos, stop
  FROM route r
  WHERE pos < 147
  AND stop >= 147
  order by stop) destiny ON destiny.pos = origin.stop
  AND origin.num <> destiny.num
JOIN stops s ON s.id = origin.pos
JOIN stops s2 ON s2.id = destiny.stop;
