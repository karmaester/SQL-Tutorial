SELECT name FROM teacher
WHERE dept IS NULL

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
  FROM teacher LEFT JOIN dept
            ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
  FROM teacher RIGHT JOIN dept
            ON (teacher.dept=dept.id)

SELECT teacher.name, COALESCE(dept.name, 'None')
  FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id)

SELECT COUNT(id), COUNT(mobile)
FROM teacher

SELECT dept.name, COUNT(teacher.name) 
  FROM teacher RIGHT JOIN dept ON (teacher.dept = dept.id)
  GROUP BY dept.name