-- ============================================================
-- BASE DE DATOS: CONTROL ESCOLAR
-- Proyecto: Practica2U5_Jorge
-- 7 tablas, 10 registros por tabla
-- Requiere MySQL 8.0 o superior
-- ============================================================

-- Si deseas reiniciar la base desde cero, descomenta la siguiente linea:
-- DROP DATABASE IF EXISTS control_escolar;

CREATE DATABASE IF NOT EXISTS control_escolar
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE control_escolar;

SET NAMES utf8mb4;

-- ------------------------------------------------------------
-- 1. ALUMNOS
-- ------------------------------------------------------------
CREATE TABLE alumnos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  matricula VARCHAR(12) NOT NULL UNIQUE,
  nombre VARCHAR(60) NOT NULL,
  apellido_paterno VARCHAR(60) NOT NULL,
  apellido_materno VARCHAR(60),
  fecha_nacimiento DATE NOT NULL,
  sexo ENUM('M','F') NOT NULL,
  curp VARCHAR(18) UNIQUE,
  correo VARCHAR(120) UNIQUE,
  telefono VARCHAR(15),
  direccion VARCHAR(200),
  fecha_inscripcion DATE NOT NULL DEFAULT (CURRENT_DATE),
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  creado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO alumnos
  (id, matricula, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, sexo, curp, correo, telefono, direccion, fecha_inscripcion, activo) VALUES
(1, 'A2025001', 'Ana Sofía',       'García',    'López',     '2008-03-14', 'F', 'GALA080314MDFRPN01', 'ana.garcia@escuela.mx',       '5551234501', 'Av. Reforma 101, CDMX',      '2025-08-20', TRUE),
(2, 'A2025002', 'Luis Fernando',   'Martínez',  'Hernández', '2007-11-02', 'M', 'MAHL071102HDFRRS02', 'luis.martinez@escuela.mx',    '5551234502', 'Calle Hidalgo 202, CDMX',    '2025-08-20', TRUE),
(3, 'A2025003', 'María Fernanda',  'Rodríguez', 'Pérez',     '2008-06-25', 'F', 'ROPF080625MDFRPR03', 'maria.rodriguez@escuela.mx',  '5551234503', 'Av. Juárez 303, CDMX',       '2025-08-21', TRUE),
(4, 'A2025004', 'Carlos Alberto',  'Sánchez',   'Ramírez',   '2007-09-18', 'M', 'SARC070918HDFRMR04', 'carlos.sanchez@escuela.mx',   '5551234504', 'Calle Morelos 404, CDMX',    '2025-08-21', TRUE),
(5, 'A2025005', 'Daniela',         'Torres',    'Flores',    '2008-01-30', 'F', 'TOFD080130MDFRRN05', 'daniela.torres@escuela.mx',   '5551234505', 'Av. Insurgentes 505, CDMX',  '2025-08-22', TRUE),
(6, 'A2025006', 'Jorge',           'López',     'Gutiérrez', '2007-05-12', 'M', 'LOGG070512HDFPTR06', 'jorge.lopez@escuela.mx',      '5551234506', 'Calle Zaragoza 606, CDMX',   '2025-08-22', TRUE),
(7, 'A2025007', 'Valeria',         'Hernández', 'Díaz',      '2008-08-07', 'F', 'HEDV080807MDFRZL07', 'valeria.hernandez@escuela.mx','5551234507', 'Av. Universidad 707, CDMX',  '2025-08-23', TRUE),
(8, 'A2025008', 'Diego',           'Ramírez',   'Cruz',      '2007-12-19', 'M', 'RACD071219HDFMRG08', 'diego.ramirez@escuela.mx',    '5551234508', 'Calle Allende 808, CDMX',    '2025-08-23', TRUE),
(9, 'A2025009', 'Paola',           'Flores',    'Mendoza',   '2008-04-03', 'F', 'FOMP080403MDFLNL09', 'paola.flores@escuela.mx',     '5551234509', 'Av. Chapultepec 909, CDMX',  '2025-08-24', TRUE),
(10,'A2025010', 'Ricardo',         'Gutiérrez', 'Ortiz',     '2007-07-27', 'M', 'GUOR070727HDFTRC10', 'ricardo.gutierrez@escuela.mx','5551234510', 'Calle Juárez 1010, CDMX',    '2025-08-24', TRUE);

-- ------------------------------------------------------------
-- 2. PROFESORES
-- ------------------------------------------------------------
CREATE TABLE profesores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  numero_empleado VARCHAR(12) NOT NULL UNIQUE,
  nombre VARCHAR(60) NOT NULL,
  apellido_paterno VARCHAR(60) NOT NULL,
  apellido_materno VARCHAR(60),
  correo VARCHAR(120) NOT NULL UNIQUE,
  telefono VARCHAR(15),
  especialidad VARCHAR(80),
  fecha_ingreso DATE NOT NULL,
  activo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;

INSERT INTO profesores
  (id, numero_empleado, nombre, apellido_paterno, apellido_materno, correo, telefono, especialidad, fecha_ingreso, activo) VALUES
(1, 'P001', 'Roberto',      'Méndez',   'Salazar', 'roberto.mendez@escuela.mx',  '5552234501', 'Matemáticas',        '2015-02-10', TRUE),
(2, 'P002', 'Laura',        'Castillo', 'Vargas',  'laura.castillo@escuela.mx',  '5552234502', 'Lengua y Literatura','2016-06-15', TRUE),
(3, 'P003', 'Miguel Ángel', 'Rojas',    'Navarro', 'miguel.rojas@escuela.mx',    '5552234503', 'Ciencias Naturales', '2014-01-20', TRUE),
(4, 'P004', 'Patricia',     'Vega',     'Romero',  'patricia.vega@escuela.mx',   '5552234504', 'Historia',           '2017-08-01', TRUE),
(5, 'P005', 'Fernando',     'Silva',    'Campos',  'fernando.silva@escuela.mx',  '5552234505', 'Inglés',             '2018-03-12', TRUE),
(6, 'P006', 'Gabriela',     'Morales',  'Reyes',   'gabriela.morales@escuela.mx','5552234506', 'Geografía',          '2019-09-05', TRUE),
(7, 'P007', 'Arturo',       'Delgado',  'Santos',  'arturo.delgado@escuela.mx',  '5552234507', 'Educación Física',   '2013-05-22', TRUE),
(8, 'P008', 'Claudia',      'Núñez',    'Herrera', 'claudia.nunez@escuela.mx',   '5552234508', 'Artes',              '2020-01-15', TRUE),
(9, 'P009', 'Héctor',       'Paredes',  'Fuentes', 'hector.paredes@escuela.mx',  '5552234509', 'Informática',        '2012-11-08', TRUE),
(10,'P010', 'Mónica',       'Aguilar',  'Cortés',  'monica.aguilar@escuela.mx',  '5552234510', 'Formación Cívica',   '2021-02-18', TRUE);

-- ------------------------------------------------------------
-- 3. MATERIAS
-- ------------------------------------------------------------
CREATE TABLE materias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  clave VARCHAR(10) NOT NULL UNIQUE,
  nombre VARCHAR(80) NOT NULL,
  descripcion VARCHAR(200),
  creditos INT NOT NULL CHECK (creditos > 0),
  horas_semana INT NOT NULL CHECK (horas_semana > 0),
  semestre INT NOT NULL CHECK (semestre BETWEEN 1 AND 6),
  id_profesor INT,
  CONSTRAINT fk_materias_profesor FOREIGN KEY (id_profesor) REFERENCES profesores(id)
) ENGINE=InnoDB;

INSERT INTO materias
  (id, clave, nombre, descripcion, creditos, horas_semana, semestre, id_profesor) VALUES
(1, 'MAT01', 'Matemáticas I',        'Aritmética y álgebra básica',        8, 5, 1, 1),
(2, 'ESP01', 'Español I',            'Comprensión y producción de textos', 8, 5, 1, 2),
(3, 'CIE01', 'Ciencias Naturales I', 'Biología y ecología',                7, 4, 1, 3),
(4, 'HIS01', 'Historia I',           'Historia de México',                 6, 3, 1, 4),
(5, 'ING01', 'Inglés I',             'Gramática y conversación básica',    6, 3, 1, 5),
(6, 'GEO01', 'Geografía I',          'Geografía física y humana',          6, 3, 1, 6),
(7, 'EFI01', 'Educación Física I',   'Acondicionamiento y deporte',        4, 2, 1, 7),
(8, 'ART01', 'Artes I',              'Expresión plástica y musical',       4, 2, 1, 8),
(9, 'INF01', 'Informática I',        'Ofimática y programación básica',    6, 3, 1, 9),
(10,'FCE01', 'Formación Cívica I',   'Ética y ciudadanía',                 5, 3, 1, 10);

-- ------------------------------------------------------------
-- 4. GRUPOS
-- ------------------------------------------------------------
CREATE TABLE grupos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  clave_grupo VARCHAR(15) NOT NULL UNIQUE,
  grado INT NOT NULL CHECK (grado BETWEEN 1 AND 3),
  seccion CHAR(1) NOT NULL,
  turno ENUM('Matutino','Vespertino') NOT NULL,
  aula VARCHAR(10) NOT NULL,
  ciclo_escolar VARCHAR(9) NOT NULL,
  id_profesor_tutor INT,
  CONSTRAINT fk_grupos_profesor FOREIGN KEY (id_profesor_tutor) REFERENCES profesores(id)
) ENGINE=InnoDB;

INSERT INTO grupos
  (id, clave_grupo, grado, seccion, turno, aula, ciclo_escolar, id_profesor_tutor) VALUES
(1, '1A-MAT', 1, 'A', 'Matutino',   '101', '2025-2026', 1),
(2, '1B-MAT', 1, 'B', 'Matutino',   '102', '2025-2026', 2),
(3, '1C-MAT', 1, 'C', 'Matutino',   '103', '2025-2026', 3),
(4, '2A-MAT', 2, 'A', 'Matutino',   '201', '2025-2026', 4),
(5, '2B-MAT', 2, 'B', 'Matutino',   '202', '2025-2026', 5),
(6, '2C-VES', 2, 'C', 'Vespertino', '203', '2025-2026', 6),
(7, '3A-MAT', 3, 'A', 'Matutino',   '301', '2025-2026', 7),
(8, '3B-VES', 3, 'B', 'Vespertino', '302', '2025-2026', 8),
(9, '3C-VES', 3, 'C', 'Vespertino', '303', '2025-2026', 9),
(10,'1D-VES', 1, 'D', 'Vespertino', '104', '2025-2026', 10);

-- ------------------------------------------------------------
-- 5. INSCRIPCIONES
-- ------------------------------------------------------------
CREATE TABLE inscripciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_alumno INT NOT NULL,
  id_grupo INT NOT NULL,
  ciclo_escolar VARCHAR(9) NOT NULL,
  fecha_inscripcion DATE NOT NULL DEFAULT (CURRENT_DATE),
  estatus ENUM('Activa','Baja','Egresado') NOT NULL DEFAULT 'Activa',
  CONSTRAINT fk_insc_alumno FOREIGN KEY (id_alumno) REFERENCES alumnos(id),
  CONSTRAINT fk_insc_grupo FOREIGN KEY (id_grupo) REFERENCES grupos(id),
  UNIQUE KEY uq_inscripcion (id_alumno, id_grupo, ciclo_escolar)
) ENGINE=InnoDB;

INSERT INTO inscripciones
  (id, id_alumno, id_grupo, ciclo_escolar, fecha_inscripcion, estatus) VALUES
(1, 1,  1, '2025-2026', '2025-08-20', 'Activa'),
(2, 2,  1, '2025-2026', '2025-08-20', 'Activa'),
(3, 3,  2, '2025-2026', '2025-08-21', 'Activa'),
(4, 4,  2, '2025-2026', '2025-08-21', 'Activa'),
(5, 5,  3, '2025-2026', '2025-08-22', 'Activa'),
(6, 6,  4, '2025-2026', '2025-08-22', 'Activa'),
(7, 7,  5, '2025-2026', '2025-08-23', 'Activa'),
(8, 8,  7, '2025-2026', '2025-08-23', 'Activa'),
(9, 9,  8, '2025-2026', '2025-08-24', 'Activa'),
(10,10, 9, '2025-2026', '2025-08-24', 'Activa');

-- ------------------------------------------------------------
-- 6. CALIFICACIONES
-- ------------------------------------------------------------
CREATE TABLE calificaciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_inscripcion INT NOT NULL,
  id_materia INT NOT NULL,
  parcial INT NOT NULL CHECK (parcial BETWEEN 1 AND 3),
  calificacion DECIMAL(4,2) NOT NULL CHECK (calificacion BETWEEN 0 AND 10),
  fecha_registro DATE NOT NULL DEFAULT (CURRENT_DATE),
  CONSTRAINT fk_cal_inscripcion FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id) ON DELETE CASCADE,
  CONSTRAINT fk_cal_materia FOREIGN KEY (id_materia) REFERENCES materias(id),
  UNIQUE KEY uq_calificacion (id_inscripcion, id_materia, parcial)
) ENGINE=InnoDB;

INSERT INTO calificaciones
  (id, id_inscripcion, id_materia, parcial, calificacion, fecha_registro) VALUES
(1, 1,  1, 1, 9.50,  '2025-10-15'),
(2, 2,  1, 1, 8.00,  '2025-10-15'),
(3, 3,  2, 1, 9.00,  '2025-10-16'),
(4, 4,  2, 1, 7.50,  '2025-10-16'),
(5, 5,  3, 1, 8.75,  '2025-10-17'),
(6, 6,  4, 1, 9.25,  '2025-10-17'),
(7, 7,  5, 1, 8.50,  '2025-10-18'),
(8, 8,  7, 1, 10.00, '2025-10-18'),
(9, 9,  8, 1, 9.75,  '2025-10-19'),
(10,10, 9, 1, 8.25,  '2025-10-19');

-- ------------------------------------------------------------
-- 7. ASISTENCIAS
-- ------------------------------------------------------------
CREATE TABLE asistencias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_inscripcion INT NOT NULL,
  fecha DATE NOT NULL,
  estatus ENUM('Presente','Ausente','Retardo','Justificado') NOT NULL,
  observaciones VARCHAR(150),
  CONSTRAINT fk_asis_inscripcion FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id) ON DELETE CASCADE,
  UNIQUE KEY uq_asistencia (id_inscripcion, fecha)
) ENGINE=InnoDB;

INSERT INTO asistencias
  (id, id_inscripcion, fecha, estatus, observaciones) VALUES
(1, 1,  '2025-10-20', 'Presente',    NULL),
(2, 2,  '2025-10-20', 'Presente',    NULL),
(3, 3,  '2025-10-20', 'Retardo',     'Llegó 15 minutos tarde'),
(4, 4,  '2025-10-20', 'Ausente',     'Sin justificante'),
(5, 5,  '2025-10-20', 'Presente',    NULL),
(6, 6,  '2025-10-21', 'Justificado', 'Cita médica'),
(7, 7,  '2025-10-21', 'Presente',    NULL),
(8, 8,  '2025-10-21', 'Presente',    NULL),
(9, 9,  '2025-10-21', 'Ausente',     'Falta injustificada'),
(10,10, '2025-10-21', 'Presente',    NULL);

-- ------------------------------------------------------------
-- Verificación: cada tabla debe devolver 10 registros
-- ------------------------------------------------------------
SELECT 'alumnos' AS tabla, COUNT(*) AS registros FROM alumnos
UNION ALL SELECT 'profesores',    COUNT(*) FROM profesores
UNION ALL SELECT 'materias',      COUNT(*) FROM materias
UNION ALL SELECT 'grupos',        COUNT(*) FROM grupos
UNION ALL SELECT 'inscripciones', COUNT(*) FROM inscripciones
UNION ALL SELECT 'calificaciones',COUNT(*) FROM calificaciones
UNION ALL SELECT 'asistencias',   COUNT(*) FROM asistencias;
