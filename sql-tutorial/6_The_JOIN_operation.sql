SELECT matchid, player
FROM goal 
WHERE teamid = 'GER';

SELECT id, stadium, team1, team2
  FROM game g
WHERE id = 1012;

SELECT player, teamid, stadium, mdate
FROM game
JOIN goal ON id=matchid
AND teamid = 'GER';

SELECT t1.id team1, t2.id team2, player
FROM game g
JOIN eteam t1 ON t1.id = g.team1
JOIN eteam t2 ON t2.id = g.team2
JOIN goal go ON g.id=go.matchid
AND go.player LIKE 'Mario%';

SELECT player, teamid, t.coach, gtime
  FROM goal g
JOIN eteam t ON teamid = id
 WHERE gtime <= 10;

SELECT mdate, t.teamname
FROM game g
JOIN eteam t ON t.id = g.team1
AND t.coach = 'Fernando Santos';

SELECT player
FROM game g
JOIN goal go ON go.matchid = g.id
WHERE stadium = 'National Stadium, Warsaw';

SELECT DISTINCT player
FROM game
JOIN goal ON matchid = id 
WHERE (team1 = 'GER'
OR team2 = 'GER')
AND teamid <> 'GER';

SELECT teamname, COUNT(*)
FROM eteam
JOIN goal ON id = teamid
GROUP BY teamname
ORDER BY teamname;

SELECT stadium, count(*)
FROM game g
JOIN goal go ON go.matchid = g.id
GROUP BY stadium;

SELECT matchid, mdate, COUNT(*)
FROM game
JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;

SELECT matchid, mdate, COUNT(*)
FROM game g
JOIN goal go ON go.matchid = g.id
WHERE go.teamid = 'GER'
GROUP BY matchid, mdate;

SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game
LEFT JOIN goal ON matchid = id
GROUP BY 1, 2, 4
ORDER BY mdate, matchid, team1, team2;