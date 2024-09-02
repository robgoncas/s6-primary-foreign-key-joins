-- 1. Listar todos los alumnos que están inscritos en algún curso, 
--mostrando el nombre del alumno y el nombre del curso en el que está inscrito.
SELECT a.nombre AS alumno, c.nombre AS curso
FROM alumnos a
INNER JOIN inscripciones i ON a.id = i.alumno_id
INNER JOIN cursos c ON i.curso_id = c.id;

-- 2. Mostrar todos los alumnos, junto con los cursos en los que están inscritos, 
--si están inscritos en alguno. Si no están inscritos en ningún curso, mostrar NULL en la columna del curso.
SELECT a.nombre AS alumno, c.nombre AS curso
FROM alumnos a
LEFT JOIN inscripciones i ON a.id = i.alumno_id
LEFT JOIN cursos c ON i.curso_id = c.id;

-- 3. Mostrar todos los cursos, junto con los alumnos inscritos en ellos. 
--Si un curso no tiene alumnos inscritos, mostrar NULL en la columna del alumno.
SELECT a.nombre AS alumno, c.nombre AS curso
FROM alumnos a
RIGHT JOIN inscripciones i ON a.id = i.alumno_id
RIGHT JOIN cursos c ON i.curso_id = c.id;

-- 4. Listar los nombres de los alumnos y los nombres de los cursos en los que están inscritos,
-- pero solo para los cursos relacionados con "Frontend".
SELECT a.nombre AS alumno, c.nombre AS curso
FROM alumnos a
INNER JOIN inscripciones i ON a.id = i.alumno_id
INNER JOIN cursos c ON i.curso_id = c.id
WHERE c.nombre ILIKE '%Frontend%';

-- 5. Mostrar todos los alumnos junto con los cursos en los que están inscritos,
-- si están inscritos en alguno, ordenando primero por el nombre del curso y luego por el nombre del alumno.
SELECT a.nombre AS alumno, c.nombre AS curso
FROM alumnos a
LEFT JOIN inscripciones i ON a.id = i.alumno_id
LEFT JOIN cursos c ON i.curso_id = c.id
ORDER BY c.nombre, a.nombre;

-- 6. Mostrar todos los cursos y los alumnos inscritos en ellos, 
--pero solo para los cursos que pertenecen al área de "Backend". Si un curso no tiene alumnos inscritos, mostrar NULL en la columna del alumno.
SELECT a.nombre AS alumno, c.nombre AS curso
FROM alumnos a
RIGHT JOIN inscripciones i ON a.id = i.alumno_id
RIGHT JOIN cursos c ON i.curso_id = c.id
WHERE c.nombre ILIKE '%Backend%';

-- 7. Mostrar la cantidad de cursos en los que cada alumno está inscrito, 
--solo para aquellos alumnos que están inscritos en al menos un curso.
SELECT a.nombre AS alumno, COUNT(i.curso_id) AS cantidad_cursos
FROM alumnos a
INNER JOIN inscripciones i ON a.id = i.alumno_id
GROUP BY a.id
HAVING COUNT(i.curso_id) > 0;

-- 8. Mostrar todos los alumnos y los cursos en los que están inscritos, pero solo para los alumnos que tienen más de 25 años. Si no están inscritos en ningún curso, mostrar NULL en la columna del curso.
SELECT a.nombre AS alumno, c.nombre AS curso
FROM alumnos a
LEFT JOIN inscripciones i ON a.id = i.alumno_id
LEFT JOIN cursos c ON i.curso_id = c.id
WHERE a.edad > 25;

-- 9. Mostrar el número de alumnos inscritos en cada curso, incluyendo los cursos que no tienen alumnos inscritos.
SELECT c.nombre AS curso, COUNT(i.alumno_id) AS cantidad_alumnos
FROM cursos c
LEFT JOIN inscripciones i ON c.id = i.curso_id
GROUP BY c.id;

-- 10. Listar todos los alumnos inscritos en cursos cuyo nombre contenga la palabra "JavaScript", mostrando el nombre del alumno y el nombre del curso.
SELECT a.nombre AS alumno, c.nombre AS curso
FROM alumnos a
INNER JOIN inscripciones i ON a.id = i.alumno_id
INNER JOIN cursos c ON i.curso_id = c.id
WHERE c.nombre ILIKE '%JavaScript%';
