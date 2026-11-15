# Practica2U5_Jorge - Control Escolar

Base de datos MySQL para el control escolar de alumnos. Incluye 7 tablas relacionadas y 10 registros de ejemplo en cada una.

## Contenido del repositorio

- **control_escolar_mysql.sql**: script de creación de la base de datos, tablas y datos de ejemplo.
- **README.md**: documentación del modelo y guía de uso.

## Requisitos

- MySQL 8.0 o superior.
- Cliente de línea de comandos mysql (opcional, también puedes usar MySQL Workbench).

## Instalación

1. Descarga o clona el repositorio.
2. Abre una terminal en la carpeta del proyecto.
3. Ejecuta el script:

    mysql -u TU_USUARIO -p < control_escolar_mysql.sql

4. Verifica que la base se creó correctamente:

    mysql -u TU_USUARIO -p -e "USE control_escolar; SHOW TABLES;"

También puedes abrir el archivo **control_escolar_mysql.sql** en MySQL Workbench y ejecutarlo con el botón de rayo.

## Modelo de datos

| Tabla | Descripción | Registros |
|---|---|---:|
| alumnos | Datos personales y de contacto de los alumnos | 10 |
| profesores | Plantilla docente de la institución | 10 |
| materias | Catálogo de materias y profesor asignado | 10 |
| grupos | Grupos por grado, sección y turno | 10 |
| inscripciones | Inscripción de alumnos a grupos por ciclo escolar | 10 |
| calificaciones | Calificaciones por inscripción, materia y parcial | 10 |
| asistencias | Registro diario de asistencia por inscripción | 10 |

## Relaciones principales

- Un alumno puede tener varias inscripciones: alumnos 1:N inscripciones.
- Un grupo puede tener varias inscripciones: grupos 1:N inscripciones.
- Un profesor puede impartir varias materias: profesores 1:N materias.
- Un profesor puede ser tutor de varios grupos: profesores 1:N grupos.
- Una inscripción puede tener varias calificaciones y asistencias: inscripciones 1:N calificaciones y asistencias.
- Cada calificación pertenece a una materia: materias 1:N calificaciones.

## Consultas de ejemplo

Mostrar todos los alumnos:

    USE control_escolar;
    SELECT * FROM alumnos;

Consultar calificaciones con nombre del alumno, grupo y materia:

    SELECT a.matricula,
           CONCAT(a.nombre, ' ', a.apellido_paterno, ' ', COALESCE(a.apellido_materno, '')) AS alumno,
           g.clave_grupo,
           m.nombre AS materia,
           c.parcial,
           c.calificacion
    FROM alumnos a
    JOIN inscripciones i ON i.id_alumno = a.id
    JOIN grupos g ON g.id = i.id_grupo
    JOIN calificaciones c ON c.id_inscripcion = i.id
    JOIN materias m ON m.id = c.id_materia
    ORDER BY a.id;

Consultar asistencias por alumno:

    SELECT a.matricula,
           CONCAT(a.nombre, ' ', a.apellido_paterno) AS alumno,
           s.fecha,
           s.estatus,
           s.observaciones
    FROM asistencias s
    JOIN inscripciones i ON i.id = s.id_inscripcion
    JOIN alumnos a ON a.id = i.id_alumno
    ORDER BY s.fecha, a.matricula;

## Notas

- El script usa CREATE DATABASE IF NOT EXISTS, por lo que no borra una base existente.
- Si necesitas reiniciar la base desde cero, descomenta la línea DROP DATABASE IF EXISTS al inicio del script.
- Las tablas usan InnoDB, charset utf8mb4 y llaves foráneas con integridad referencial.
- Los datos son ficticios y sirven como ejemplo para prácticas escolares.

## Autor

Jorge Silias - Practica2U5_Jorge
