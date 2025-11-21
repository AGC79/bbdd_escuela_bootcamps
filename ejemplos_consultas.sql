-- Ver los proyectos realizados junto con alumno y proyecto
SELECT pr.id_proyectos_realizados, a.nombre AS alumno, p.nombre AS proyecto, pr.calificacion
FROM proyectos_realizados pr
JOIN alumno a ON pr.id_alumno = a.id_alumno
JOIN proyectos p ON pr.id_proyecto = p.id_proyecto;

-- Obtener calificaciones de Mireia Cabañas
SELECT a.nombre, p.nombre AS proyecto, pr.calificacion
FROM proyectos_realizados pr
JOIN alumno a ON pr.id_alumno = a.id_alumno
JOIN proyectos p ON pr.id_proyecto = p.id_proyecto
WHERE a.nombre = 'Mireia Cabañas';

-- Proyectos disponibles en cada bootcamp
SELECT b.nombre AS bootcamp,
       p.nombre AS proyecto
FROM proyectos p
JOIN bootcamp b ON p.id_bootcamp = b.id_bootcamp
ORDER BY b.nombre, p.id_proyecto;

-- Profesores que imparten un bootcamp, con campus y promoción
SELECT prof.nombre AS profesor,
       prof.rol,
       b.nombre AS bootcamp,
       c.nombre AS campus,
       p.mes AS promocion
FROM profesor prof
JOIN bootcamp b ON prof.id_bootcamp = b.id_bootcamp
JOIN campus c ON prof.id_campus = c.id_campus
JOIN promocion p ON prof.id_promocion = p.id_promocion;

-- Profesores que tiene Timoteo Trillo
SELECT a.nombre AS alumno,
       prof.nombre AS profesor,
       prof.rol,
       prof.modalidad
FROM alumno a
JOIN profesor prof
    ON a.id_bootcamp = prof.id_bootcamp
   AND a.id_promocion = prof.id_promocion
   AND a.id_campus = prof.id_campus
WHERE a.nombre = 'Timoteo Trillo';