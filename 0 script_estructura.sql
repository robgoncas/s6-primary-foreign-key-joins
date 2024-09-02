-- Creación de la base de datos
CREATE DATABASE edutecno;

-- Conectarse a la base de datos creada
\c edutecno;

-- Creación de la tabla 'alumnos'
CREATE TABLE alumnos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT
);

-- Creación de la tabla 'cursos'
CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Creación de la tabla 'inscripciones'
CREATE TABLE inscripciones (
    alumno_id INT REFERENCES alumnos(id),
    curso_id INT REFERENCES cursos(id),
    PRIMARY KEY (alumno_id, curso_id)
);

