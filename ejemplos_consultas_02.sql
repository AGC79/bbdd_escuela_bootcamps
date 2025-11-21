-- ¿Cuántos alumnos totales han tenido los bootcamps de The Bridge?
SELECT bootcamp.nombre, COUNT(alumno.email) AS total_alumnos FROM bootcamp
INNER JOIN alumno ON bootcamp.id_bootcamp = alumno.id_bootcamp
GROUP BY bootcamp.nombre;

--¿Cuántos profesores ha habido en cada campus por modalidad?
SELECT campus.nombre AS campus,profesor.modalidad, COUNT(profesor.id_profesor) AS total_profesores
FROM profesor
INNER JOIN campus ON profesor.id_campus = campus.id_campus
GROUP BY campus.nombre, profesor.modalidad;

--¿Cuántos proyectos se han realizado por bootcamp?
SELECT bootcamp.nombre AS bootcamp, COUNT(proyectos.id_proyecto) AS total_proyectos
FROM bootcamp
INNER JOIN proyectos ON bootcamp.id_bootcamp = proyectos.id_bootcamp
GROUP BY bootcamp.nombre;

--¿Cuáles han sido las calificaciones totales por bootcamp y año?
SELECT bootcamp.nombre AS bootcamp,
EXTRACT(YEAR FROM alumno.fecha_inicio) AS anio,
COUNT(CASE WHEN proyectos_realizados.calificacion = 'Apto' THEN 1 END) AS total_apto,
COUNT(CASE WHEN proyectos_realizados.calificacion = 'No Apto' THEN 1 END) AS total_no_apto
FROM proyectos_realizados
INNER JOIN proyectos ON proyectos_realizados.id_proyecto = proyectos.id_proyecto
INNER JOIN bootcamp ON proyectos.id_bootcamp = bootcamp.id_bootcamp
INNER JOIN alumno ON proyectos_realizados.id_alumno = alumno.id_alumno
GROUP BY bootcamp.nombre, EXTRACT(YEAR FROM alumno.fecha_inicio)
ORDER BY anio,bootcamp.nombre;

--¿Cuáles han sido las calificaciones totales por campus y año?
SELECT campus.nombre AS campus,
EXTRACT(YEAR FROM alumno.fecha_inicio) AS anio,
COUNT(CASE WHEN proyectos_realizados.calificacion = 'Apto' THEN 1 END) AS total_apto,
COUNT(CASE WHEN proyectos_realizados.calificacion = 'No Apto' THEN 1 END) AS total_no_apto
FROM proyectos_realizados
INNER JOIN proyectos ON proyectos_realizados.id_proyecto = proyectos.id_proyecto
INNER JOIN alumno ON proyectos_realizados.id_alumno = alumno.id_alumno
INNER JOIN campus ON alumno.id_campus = campus.id_campus
GROUP BY campus.nombre, EXTRACT(YEAR FROM alumno.fecha_inicio)
ORDER BY anio,campus;

--¿Cuál es el bootcamp con el mayor número de alumnos?
SELECT bootcamp.nombre, COUNT(alumno.id_alumno) AS TotalAlumnos
FROM bootcamp
JOIN alumno ON bootcamp.id_bootcamp = alumno.id_bootcamp
GROUP BY bootcamp.nombre
ORDER BY TotalAlumnos DESC
LIMIT 1;

-- Insertar un nuevo campus: 
INSERT INTO campus (id_campus, nombre)
VALUES (98, 'La_Palma');