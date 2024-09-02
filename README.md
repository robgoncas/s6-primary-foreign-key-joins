### Explicación de Claves Primarias y Foráneas

**1. Clave Primaria:**
   - Una **clave primaria** es una columna (o un conjunto de columnas) en una tabla que se utiliza para identificar de manera única cada fila en esa tabla. 
   - Las claves primarias deben cumplir dos características principales: 
     1. **Unicidad**: No puede haber dos filas con el mismo valor en la clave primaria.
     2. **No Nulo**: Los valores de una clave primaria no pueden ser nulos.
   - Ejemplo en PostgreSQL:
     ```sql
     CREATE TABLE alumnos (
         id SERIAL PRIMARY KEY,
         nombre VARCHAR(100),
         edad INT
     );
     ```
     En este ejemplo, `id` es la clave primaria de la tabla `alumnos`. Cada `id` es único y no puede ser nulo.

**2. Clave Foránea:**
   - Una **clave foránea** es una columna (o un conjunto de columnas) en una tabla que se utiliza para establecer y reforzar un vínculo entre los datos de dos tablas.
   - La clave foránea en una tabla apunta a una clave primaria en otra tabla, creando así una relación entre las dos tablas.
   - Ejemplo en PostgreSQL:
     ```sql
     CREATE TABLE cursos (
         id SERIAL PRIMARY KEY,
         nombre VARCHAR(100)
     );

     CREATE TABLE inscripciones (
         alumno_id INT REFERENCES alumnos(id),
         curso_id INT REFERENCES cursos(id),
         PRIMARY KEY (alumno_id, curso_id)
     );
     ```
     En este caso, `alumno_id` y `curso_id` son claves foráneas en la tabla `inscripciones`, referenciando las claves primarias de las tablas `alumnos` y `cursos` respectivamente. Esto establece que cada inscripción debe referirse a un alumno y a un curso existentes.

### Explicación de INNER JOIN, LEFT JOIN, y RIGHT JOIN

**1. INNER JOIN:**
   - Un **INNER JOIN** devuelve las filas que tienen coincidencias en ambas tablas involucradas en el join. Si una fila de la primera tabla no tiene una correspondencia en la segunda tabla, esa fila no se incluirá en el resultado.
   - Ejemplo en PostgreSQL:
     ```sql
     SELECT a.nombre, c.nombre
     FROM alumnos AS a
     INNER JOIN inscripciones AS i ON a.id = i.alumno_id
     INNER JOIN cursos AS c ON i.curso_id = c.id;
     ```
     Este query devuelve una lista de alumnos y los cursos en los que están inscritos, mostrando solo los alumnos que tienen inscripciones.

**2. LEFT JOIN:**
   - Un **LEFT JOIN** devuelve todas las filas de la tabla a la izquierda del join y las filas coincidentes de la tabla a la derecha del join. Si no hay coincidencias, se rellena con NULL para las columnas de la tabla a la derecha.
   - Ejemplo en PostgreSQL:
     ```sql
     SELECT a.nombre, c.nombre
     FROM alumnos a
     LEFT JOIN inscripciones i ON a.id = i.alumno_id
     LEFT JOIN cursos c ON i.curso_id = c.id;
     ```
     Este query devolverá todos los alumnos, y si un alumno no está inscrito en ningún curso, el nombre del curso aparecerá como NULL.

**3. RIGHT JOIN:**
   - Un **RIGHT JOIN** es lo contrario del LEFT JOIN. Devuelve todas las filas de la tabla a la derecha del join y las filas coincidentes de la tabla a la izquierda. Si no hay coincidencias, se rellena con NULL para las columnas de la tabla a la izquierda.
   - Ejemplo en PostgreSQL:
     ```sql
     SELECT a.nombre, c.nombre
     FROM alumnos a
     RIGHT JOIN inscripciones i ON a.id = i.alumno_id
     RIGHT JOIN cursos c ON i.curso_id = c.id;
     ```
     Este query devolverá todos los cursos y los alumnos inscritos en ellos. Si un curso no tiene alumnos inscritos, el nombre del alumno aparecerá como NULL.


### Ejemplos de INNER JOIN, LEFT JOIN, y RIGHT JOIN

Lista todos los alumnos que están inscritos en algún curso, mostrando el nombre del alumno y el nombre del curso en el que está inscrito.

Muestra todos los alumnos, junto con los cursos en los que están inscritos, si están inscritos en alguno. Si no están inscritos en ningún curso, muestra NULL en la columna del curso.

Muestra todos los cursos, junto con los alumnos inscritos en ellos. Si un curso no tiene alumnos inscritos, muestra NULL en la columna del alumno.

Lista los nombres de los alumnos y los nombres de los cursos en los que están inscritos, pero solo para los cursos relacionados con "Frontend".

Muestra todos los alumnos junto con los cursos en los que están inscritos, si están inscritos en alguno, ordenando primero por el nombre del curso y luego por el nombre del alumno.

Muestra todos los cursos y los alumnos inscritos en ellos, pero solo para los cursos que pertenecen al área de "Backend". Si un curso no tiene alumnos inscritos, muestra NULL en la columna del alumno.

Muestra la cantidad de cursos en los que cada alumno está inscrito, solo para aquellos alumnos que están inscritos en al menos un curso.

Muestra todos los alumnos y los cursos en los que están inscritos, pero solo para los alumnos que tienen más de 25 años. Si no están inscritos en ningún curso, muestra NULL en la columna del curso.

Muestra el número de alumnos inscritos en cada curso, incluyendo los cursos que no tienen alumnos inscritos.

Lista todos los alumnos inscritos en cursos cuyo nombre contenga la palabra "JavaScript", mostrando el nombre del alumno y el nombre del curso.