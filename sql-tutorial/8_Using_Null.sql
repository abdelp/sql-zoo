SELECT name
FROM teacher
WHERE dept IS NULL;

SELECT teacher.name, dept.name
FROM teacher
INNER JOIN dept ON teacher.dept = dept.id;

SELECT teacher.name, dept.name
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id;

SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

SELECT t.name, COALESCE(d.name, 'None')
FROM teacher t
LEFT JOIN dept d ON d.id = t.dept;

SELECT COUNT(*), COUNT(mobile)
FROM teacher;

SELECT d.name, COUNT(t.id)
FROM teacher t
RIGHT JOIN dept d ON d.id = t.dept
GROUP BY d.name;

SELECT t.name, CASE WHEN d.id IN(1, 2) THEN 'Sci' ELSE 'Art' END
FROM teacher t
LEFT JOIN dept d ON d.id = t.dept;

SELECT t.name, CASE WHEN d.id IN(1, 2) THEN 'Sci' WHEN d.id = 3 THEN 'Art' ELSE 'None' END
FROM teacher t
LEFT JOIN dept d ON d.id = t.dept;