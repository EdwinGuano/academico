-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-01-2022 a las 17:19:48
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `system_academic`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `dni_al` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_al` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ape_al` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lnac_al` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fnac_al` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiposangre_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipogrado_id` bigint(20) UNSIGNED DEFAULT NULL,
  `especialidad_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reparto_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `id_user`, `dni_al`, `nom_al`, `ape_al`, `lnac_al`, `fnac_al`, `email`, `tiposangre_id`, `tipogrado_id`, `especialidad_id`, `reparto_id`, `created_at`, `updated_at`) VALUES
(35, 38, '1804777595', 'Edwin Vladimir', 'Guano Cunalata', 'Abancay', '2021-11-30', NULL, 1, 1, 1, 1, '2021-11-30 16:49:13', '2021-12-14 00:29:52'),
(36, 40, '7896541235', 'Anabel Pamela', 'Tite Aman', 'Guayaquil', '2021-11-30', NULL, 1, 1, 1, 1, '2021-12-13 17:41:23', '2021-12-14 00:34:10'),
(37, 41, '1597532584', 'Sandra Elizabeth', 'Sanchez Carrasco', 'Lago Agrio', '2021-11-30', NULL, 1, 1, 1, 1, '2021-12-14 00:31:19', '2021-12-14 00:34:27'),
(38, 42, '7412589630', 'Juan Andres', 'Carrasco Alvarado', 'Quito', '2021-12-01', NULL, 1, 1, 1, 1, '2021-12-14 00:32:03', '2021-12-14 00:34:42'),
(39, 43, '7894561235', 'Sandra Anabel', 'Suarez Aman', 'Ambato', '2021-12-01', NULL, 1, 4, 1, 1, '2021-12-14 00:32:52', '2021-12-14 00:34:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignadocs`
--

CREATE TABLE `asignadocs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `docente_id` bigint(20) UNSIGNED NOT NULL,
  `periodo_id` bigint(20) UNSIGNED NOT NULL,
  `seccion_id` bigint(20) UNSIGNED NOT NULL,
  `curso_id` bigint(20) NOT NULL,
  `materia_id` bigint(20) UNSIGNED NOT NULL,
  `aula_id` bigint(20) UNSIGNED NOT NULL,
  `porcentaje_individual` decimal(6,2) NOT NULL,
  `porcentaje_grupal` decimal(6,2) NOT NULL,
  `porcentaje_actitudinal` decimal(6,2) NOT NULL,
  `estado` enum('Asignado','Planificado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `asignadocs`
--

INSERT INTO `asignadocs` (`id`, `docente_id`, `periodo_id`, `seccion_id`, `curso_id`, `materia_id`, `aula_id`, `porcentaje_individual`, `porcentaje_grupal`, `porcentaje_actitudinal`, `estado`, `created_at`, `updated_at`) VALUES
(32, 21, 12, 1, 4, 13, 1, '60.00', '30.00', '10.00', 'Planificado', '2021-12-14 00:39:06', '2021-12-22 00:01:29'),
(33, 22, 12, 1, 4, 11, 1, '60.00', '30.00', '10.00', 'Planificado', '2021-12-14 00:39:28', '2021-12-14 00:45:02'),
(34, 22, 12, 1, 4, 7, 1, '60.00', '30.00', '10.00', 'Planificado', '2021-12-14 00:51:14', '2021-12-21 23:59:53'),
(35, 23, 12, 1, 4, 10, 1, '60.00', '30.00', '10.00', 'Planificado', '2021-12-14 00:53:47', '2021-12-14 00:56:16'),
(36, 24, 12, 1, 4, 4, 1, '60.00', '30.00', '10.00', 'Planificado', '2021-12-22 00:07:00', '2021-12-22 00:10:59'),
(37, 25, 12, 1, 4, 5, 1, '60.00', '30.00', '10.00', 'Planificado', '2021-12-22 00:09:42', '2021-12-22 00:11:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cod_aul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_aul` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`id`, `cod_aul`, `num_aul`, `created_at`, `updated_at`) VALUES
(1, 'A001', 'A1', '2021-09-30 01:10:12', '2021-09-30 01:10:12'),
(5, 'A002', 'A2', '2021-12-24 09:56:29', '2021-12-24 09:56:29'),
(6, 'A001', 'asa', '2021-12-25 01:37:08', '2021-12-25 01:37:08'),
(7, 'asas', 'asas', '2021-12-25 01:37:12', '2021-12-25 01:37:12'),
(8, 'asas', 'asas', '2021-12-25 01:37:16', '2021-12-25 01:37:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cod_cur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_cur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `narea_cur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nhor_cur` int(11) NOT NULL,
  `ejecurso_id` bigint(20) UNSIGNED NOT NULL,
  `tipocurso_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `cod_cur`, `nom_cur`, `narea_cur`, `nhor_cur`, `ejecurso_id`, `tipocurso_id`, `created_at`, `updated_at`) VALUES
(1, 'A001', 'CURSO DE NAVEGACION AEREA', 'Sociales', 25, 1, 1, '2021-09-30 01:12:25', '2021-09-30 01:12:25'),
(4, 'A002', 'CURSO DE TRANSITO AÉREO', 'Sociales', 180, 1, 1, '2021-10-01 06:28:32', '2021-10-01 06:28:32'),
(5, 'A003', 'CURSO CONTROL DE SUPERFICIE DE AERODROMO', 'Sociales', 50, 1, 2, '2021-10-01 06:29:19', '2021-10-01 06:29:19'),
(6, 'A004', 'CURSO DE ADOCTRINAMIENTO EN EL TRABAJO', 'Sociales', 100, 1, 1, '2021-10-01 06:30:18', '2021-10-01 06:30:18'),
(7, 'A005', 'CURSO  SUPERVISORES DE AERODROMO', 'Sociales', 100, 1, 2, '2021-10-01 06:33:11', '2021-10-01 06:33:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_materia`
--

CREATE TABLE `curso_materia` (
  `materia_id` bigint(20) UNSIGNED NOT NULL,
  `curso_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `curso_materia`
--

INSERT INTO `curso_materia` (`materia_id`, `curso_id`) VALUES
(2, 1),
(1, 1),
(3, 1),
(5, 1),
(13, 4),
(11, 4),
(10, 4),
(7, 4),
(5, 4),
(4, 4),
(1, 5),
(5, 5),
(3, 5),
(7, 5),
(9, 5),
(2, 6),
(3, 6),
(8, 6),
(9, 6),
(11, 6),
(13, 7),
(5, 7),
(2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalplanevas`
--

CREATE TABLE `detalplanevas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipoact_acti` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descrip_detac` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poreva_detac` int(11) DEFAULT 0,
  `planeva_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalplanevas`
--

INSERT INTO `detalplanevas` (`id`, `tipoact_acti`, `descrip_detac`, `poreva_detac`, `planeva_id`, `created_at`, `updated_at`) VALUES
(53, 'Aporte actitudinal', 'asistencia', NULL, 45, '2021-12-10 19:00:01', '2021-12-10 19:00:01'),
(54, 'Aporte individual', 'tarea1 : los estudiantes deben realizar un monografía', NULL, 46, '2021-12-10 19:00:25', '2021-12-10 19:00:25'),
(55, 'Aporte individual', 'tarea2: segunda tarea', NULL, 47, '2021-12-10 19:00:41', '2021-12-10 19:00:41'),
(56, 'Aporte grupal', 'grupal 1', NULL, 48, '2021-12-10 19:00:55', '2021-12-10 19:00:55'),
(57, 'Aporte grupal', 'grupal 2', NULL, 49, '2021-12-10 19:01:06', '2021-12-10 19:01:06'),
(58, 'Aporte actitudinal', 'actitudinal', NULL, 50, '2021-12-13 20:28:39', '2021-12-13 20:28:39'),
(59, 'Aporte individual', 'individual', NULL, 51, '2021-12-13 20:28:51', '2021-12-13 20:28:51'),
(60, 'Aporte grupal', 'gruapal', NULL, 52, '2021-12-13 20:29:01', '2021-12-13 20:29:01'),
(63, 'Aporte actitudinal', 'actitudinal', NULL, 55, '2021-12-13 20:38:32', '2021-12-13 20:38:32'),
(64, 'Aporte individual', 'individual', NULL, 56, '2021-12-13 20:38:40', '2021-12-13 20:38:40'),
(65, 'Aporte grupal', 'Ensayo \"Historia de la Aviación\"', NULL, 57, '2021-12-14 00:43:56', '2021-12-14 00:43:56'),
(66, 'Aporte grupal', 'Exposición \"Guerra del Cenepa\"', NULL, 58, '2021-12-14 00:44:08', '2021-12-14 00:44:08'),
(67, 'Aporte individual', 'Examen unidad Nro1', NULL, 59, '2021-12-14 00:44:32', '2021-12-14 00:44:32'),
(68, 'Aporte individual', 'Examen de unidades Finales', NULL, 60, '2021-12-14 00:44:46', '2021-12-14 00:44:46'),
(69, 'Aporte actitudinal', 'Participación en clases', NULL, 61, '2021-12-14 00:44:59', '2021-12-14 00:44:59'),
(70, 'Aporte actitudinal', 'Participación en clases', NULL, 62, '2021-12-14 00:54:31', '2021-12-14 00:54:31'),
(71, 'Aporte individual', 'Maqueta \"radar\"', NULL, 63, '2021-12-14 00:55:05', '2021-12-14 00:55:05'),
(72, 'Aporte grupal', 'Ensayo \"Historia de la Aviación\"', NULL, 64, '2021-12-14 00:55:23', '2021-12-14 00:55:23'),
(73, 'Aporte individual', 'Examen de unidades Finales', NULL, 65, '2021-12-14 00:55:39', '2021-12-14 00:55:39'),
(74, 'Aporte grupal', 'Exposición \"radio ayudas\"', NULL, 66, '2021-12-14 00:56:13', '2021-12-14 00:56:13'),
(75, 'Aporte actitudinal', 'Asistencia en Clases', NULL, 67, '2021-12-21 23:58:54', '2021-12-21 23:58:54'),
(76, 'Aporte grupal', 'Maqueta', NULL, 68, '2021-12-21 23:59:11', '2021-12-21 23:59:11'),
(77, 'Aporte grupal', 'Ensayo \"Historia de la Aviación\"', NULL, 69, '2021-12-21 23:59:23', '2021-12-21 23:59:23'),
(78, 'Aporte individual', 'Unidad No1', NULL, 70, '2021-12-21 23:59:36', '2021-12-21 23:59:36'),
(79, 'Aporte individual', 'Unidad Nro 2', NULL, 71, '2021-12-21 23:59:50', '2021-12-21 23:59:50'),
(80, 'Aporte actitudinal', 'Participación en clases', NULL, 72, '2021-12-22 00:00:20', '2021-12-22 00:00:20'),
(81, 'Aporte grupal', 'Ensayo \"Historia de la Aviación\"', NULL, 73, '2021-12-22 00:00:30', '2021-12-22 00:00:30'),
(82, 'Aporte grupal', 'Tarea grupal Nro1', NULL, 74, '2021-12-22 00:00:44', '2021-12-22 00:00:44'),
(83, 'Aporte individual', 'Examen unidad Nro1', NULL, 75, '2021-12-22 00:00:59', '2021-12-22 00:00:59'),
(84, 'Aporte individual', 'Examen libro nro 1', NULL, 76, '2021-12-22 00:01:27', '2021-12-22 00:01:27'),
(85, 'Aporte actitudinal', 'Participación en clases', NULL, 77, '2021-12-22 00:10:08', '2021-12-22 00:10:08'),
(86, 'Aporte grupal', 'Exposición \"Guerra del Cenepa\"', NULL, 78, '2021-12-22 00:10:22', '2021-12-22 00:10:22'),
(87, 'Aporte grupal', 'Ensayo \"Historia de la Aviación\"', NULL, 79, '2021-12-22 00:10:29', '2021-12-22 00:10:29'),
(88, 'Aporte individual', 'Examen unidad Nro1', NULL, 80, '2021-12-22 00:10:45', '2021-12-22 00:10:45'),
(89, 'Aporte individual', 'Examen de unidades Finales', NULL, 81, '2021-12-22 00:10:56', '2021-12-22 00:10:56'),
(90, 'Aporte actitudinal', 'Participación en clases', NULL, 82, '2021-12-22 00:11:12', '2021-12-22 00:11:12'),
(91, 'Aporte individual', 'Examen de unidades Finales', NULL, 83, '2021-12-22 00:11:24', '2021-12-22 00:11:24'),
(92, 'Aporte individual', 'Examen unidad Nro1', NULL, 84, '2021-12-22 00:11:32', '2021-12-22 00:11:32'),
(93, 'Aporte grupal', 'Exposición final grupal', NULL, 85, '2021-12-22 00:11:42', '2021-12-22 00:11:42'),
(94, 'Aporte grupal', 'Examen unidad Nro1', NULL, 86, '2021-12-22 00:11:55', '2021-12-22 00:11:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `dni_doc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_doc` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ape_doc` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instt_docp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cobt_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lnac_doc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fnac_doc` date DEFAULT NULL,
  `tiposangre_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipogrado_id` bigint(20) UNSIGNED DEFAULT NULL,
  `especialidad_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reparto_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`id`, `id_user`, `dni_doc`, `nom_doc`, `ape_doc`, `instt_docp`, `cobt_doc`, `lnac_doc`, `fnac_doc`, `tiposangre_id`, `tipogrado_id`, `especialidad_id`, `reparto_id`, `created_at`, `updated_at`) VALUES
(20, 38, '1804777595', 'Edwin Vladimir', 'Guano Cunalata', 'ESPE', '19', 'Ambato', '2021-11-30', 1, 1, 1, 1, '2021-11-30 17:16:12', '2021-12-14 00:35:21'),
(21, 40, '7896541235', 'Anabel Pamela', 'Tite Aman', 'UTPL', '19', 'Guayaquil', '2021-11-29', 1, 1, 1, 1, '2021-11-30 19:07:06', '2021-12-14 00:35:45'),
(22, 42, '7412589630', 'Juan Andres', 'Carrasco Alvarado', 'EJERCITO', '20', 'Guayaquil', '2021-11-30', 1, 1, 2, 1, '2021-12-14 00:32:03', '2021-12-14 00:36:11'),
(23, 44, '1854254877', 'Cristian Andres', 'Yanez Ramirez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-14 00:53:14', '2021-12-14 00:53:14'),
(24, 45, '2587413695', 'Jorge Andres', 'Calderon Suarez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-22 00:06:23', '2021-12-22 00:06:23'),
(25, 46, '8521478965', 'Fabian Andres', 'Guano Paredes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-22 00:07:38', '2021-12-22 00:07:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejecursos`
--

CREATE TABLE `ejecursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom_ejecurso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_ejecurso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ejecursos`
--

INSERT INTO `ejecursos` (`id`, `nom_ejecurso`, `desc_ejecurso`, `created_at`, `updated_at`) VALUES
(1, 'Ciencia militar', 'Ciencia militar', '2021-09-30 01:08:44', '2021-09-30 01:08:44'),
(2, 'Cultura militar', 'Cultura militar', '2021-09-30 01:09:01', '2021-09-30 01:09:01'),
(3, 'Ciencia Tecnologica', 'Tecnologia', '2021-10-01 06:09:41', '2021-10-01 06:09:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidads`
--

CREATE TABLE `especialidads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom_especialidad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_especialidad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `especialidads`
--

INSERT INTO `especialidads` (`id`, `nom_especialidad`, `desc_especialidad`, `created_at`, `updated_at`) VALUES
(1, 'Defensa Aérea', 'Defensa aerea', '2021-09-30 01:06:49', '2021-09-30 01:06:49'),
(2, 'Navegación Aérea', 'Navegación', '2021-09-30 01:06:59', '2021-09-30 01:06:59'),
(3, 'Controlador de transito Aéreo', 'Controlador de transito Aéreo', '2021-10-01 06:00:47', '2021-10-01 06:00:47'),
(4, 'Navegación Aérea', 'Navegación Aérea', '2021-10-01 06:00:56', '2021-10-01 06:00:56'),
(5, 'Electrogeneradores', 'Electrogeneradores', '2021-10-01 06:03:26', '2021-10-01 06:03:26'),
(6, 'Transportación Terrestre', 'Transportación Terrestre', '2021-10-01 06:03:39', '2021-10-01 06:03:39'),
(7, 'Sanidad', 'Sanidad', '2021-10-01 06:03:50', '2021-10-01 06:03:50'),
(8, 'Comunicación Social', 'Comunicación Social', '2021-10-01 06:04:05', '2021-10-01 06:04:05'),
(9, 'Omitido', 'Ninguno', '2021-10-01 06:33:59', '2021-10-01 06:33:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacions`
--

CREATE TABLE `evaluacions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecreg_eval` date NOT NULL,
  `nota_deteva` int(11) DEFAULT 0,
  `alumno_id` bigint(20) UNSIGNED NOT NULL,
  `periodo_id` bigint(20) UNSIGNED NOT NULL,
  `materia_id` bigint(20) UNSIGNED NOT NULL,
  `detalplaneva_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `evaluacions`
--

INSERT INTO `evaluacions` (`id`, `fecreg_eval`, `nota_deteva`, `alumno_id`, `periodo_id`, `materia_id`, `detalplaneva_id`, `created_at`, `updated_at`) VALUES
(178, '2021-12-10', 20, 35, 11, 2, 53, '2021-12-10 19:01:13', '2021-12-18 18:18:35'),
(179, '2021-12-10', 18, 35, 11, 2, 54, '2021-12-10 19:01:13', '2021-12-13 19:22:01'),
(180, '2021-12-10', 20, 35, 11, 2, 55, '2021-12-10 19:01:13', '2021-12-18 18:18:26'),
(181, '2021-12-10', 20, 35, 11, 2, 56, '2021-12-10 19:01:13', '2021-12-18 18:18:31'),
(182, '2021-12-10', 16, 35, 11, 2, 57, '2021-12-10 19:01:13', '2021-12-13 19:22:13'),
(183, '2021-12-13', 10, 35, 11, 5, 58, '2021-12-13 20:29:07', '2021-12-13 20:30:10'),
(184, '2021-12-13', 15, 35, 11, 5, 59, '2021-12-13 20:29:07', '2021-12-13 20:30:04'),
(185, '2021-12-13', 11, 35, 11, 5, 60, '2021-12-13 20:29:07', '2021-12-13 20:30:08'),
(186, '2021-12-13', 0, 35, 11, 3, 63, '2021-12-13 20:38:43', '2021-12-13 20:38:43'),
(187, '2021-12-13', 0, 35, 11, 3, 64, '2021-12-13 20:38:43', '2021-12-13 20:38:43'),
(188, '2021-12-13', 19, 35, 12, 11, 65, '2021-12-14 00:45:03', '2021-12-14 00:45:39'),
(189, '2021-12-13', 18, 35, 12, 11, 66, '2021-12-14 00:45:03', '2021-12-14 00:45:42'),
(190, '2021-12-13', 18, 35, 12, 11, 67, '2021-12-14 00:45:03', '2021-12-14 00:45:15'),
(191, '2021-12-13', 20, 35, 12, 11, 68, '2021-12-14 00:45:03', '2021-12-14 00:45:26'),
(192, '2021-12-13', 20, 35, 12, 11, 69, '2021-12-14 00:45:03', '2021-12-14 00:45:45'),
(193, '2021-12-13', 19, 36, 12, 11, 65, '2021-12-14 00:45:03', '2021-12-14 00:45:48'),
(194, '2021-12-13', 20, 36, 12, 11, 66, '2021-12-14 00:45:03', '2021-12-14 00:45:49'),
(195, '2021-12-13', 15, 36, 12, 11, 67, '2021-12-14 00:45:03', '2021-12-14 00:45:17'),
(196, '2021-12-13', 20, 36, 12, 11, 68, '2021-12-14 00:45:03', '2021-12-14 00:45:28'),
(197, '2021-12-13', 20, 36, 12, 11, 69, '2021-12-14 00:45:03', '2021-12-14 00:45:51'),
(198, '2021-12-13', 20, 37, 12, 11, 65, '2021-12-14 00:45:03', '2021-12-14 00:45:53'),
(199, '2021-12-13', 18, 37, 12, 11, 66, '2021-12-14 00:45:03', '2021-12-14 00:45:54'),
(200, '2021-12-13', 18, 37, 12, 11, 67, '2021-12-14 00:45:03', '2021-12-14 00:45:20'),
(201, '2021-12-13', 20, 37, 12, 11, 68, '2021-12-14 00:45:03', '2021-12-14 00:45:31'),
(202, '2021-12-13', 20, 37, 12, 11, 69, '2021-12-14 00:45:03', '2021-12-14 00:45:56'),
(203, '2021-12-13', 20, 38, 12, 11, 65, '2021-12-14 00:45:03', '2021-12-14 00:45:59'),
(204, '2021-12-13', 18, 38, 12, 11, 66, '2021-12-14 00:45:03', '2021-12-14 00:46:00'),
(205, '2021-12-13', 20, 38, 12, 11, 67, '2021-12-14 00:45:03', '2021-12-14 00:45:22'),
(206, '2021-12-13', 20, 38, 12, 11, 68, '2021-12-14 00:45:03', '2021-12-14 00:45:34'),
(207, '2021-12-13', 18, 38, 12, 11, 69, '2021-12-14 00:45:03', '2021-12-14 00:46:02'),
(208, '2021-12-13', 10, 39, 12, 11, 65, '2021-12-14 00:45:03', '2021-12-22 00:14:43'),
(209, '2021-12-13', 10, 39, 12, 11, 66, '2021-12-14 00:45:03', '2021-12-22 00:14:36'),
(210, '2021-12-13', 10, 39, 12, 11, 67, '2021-12-14 00:45:03', '2021-12-22 00:14:33'),
(211, '2021-12-13', 1, 39, 12, 11, 68, '2021-12-14 00:45:03', '2021-12-22 00:14:34'),
(212, '2021-12-13', 16, 39, 12, 11, 69, '2021-12-14 00:45:03', '2021-12-22 00:14:40'),
(213, '2021-12-13', 20, 35, 12, 10, 70, '2021-12-14 00:56:16', '2021-12-14 00:56:39'),
(214, '2021-12-13', 20, 35, 12, 10, 71, '2021-12-14 00:56:16', '2021-12-14 00:56:28'),
(215, '2021-12-13', 20, 35, 12, 10, 72, '2021-12-14 00:56:16', '2021-12-14 00:56:36'),
(216, '2021-12-13', 20, 35, 12, 10, 73, '2021-12-14 00:56:16', '2021-12-14 00:56:29'),
(217, '2021-12-13', 18, 35, 12, 10, 74, '2021-12-14 00:56:16', '2021-12-14 00:56:31'),
(218, '2021-12-13', 18, 36, 12, 10, 70, '2021-12-14 00:56:16', '2021-12-14 00:56:54'),
(219, '2021-12-13', 18, 36, 12, 10, 71, '2021-12-14 00:56:16', '2021-12-14 00:56:43'),
(220, '2021-12-13', 15, 36, 12, 10, 72, '2021-12-14 00:56:16', '2021-12-14 00:56:50'),
(221, '2021-12-13', 20, 36, 12, 10, 73, '2021-12-14 00:56:16', '2021-12-14 00:56:44'),
(222, '2021-12-13', 20, 36, 12, 10, 74, '2021-12-14 00:56:16', '2021-12-14 00:56:46'),
(223, '2021-12-13', 20, 37, 12, 10, 70, '2021-12-14 00:56:16', '2021-12-14 00:57:02'),
(224, '2021-12-13', 20, 37, 12, 10, 71, '2021-12-14 00:56:16', '2021-12-21 23:38:35'),
(225, '2021-12-13', 18, 37, 12, 10, 72, '2021-12-14 00:56:16', '2021-12-14 00:56:59'),
(226, '2021-12-13', 20, 37, 12, 10, 73, '2021-12-14 00:56:16', '2021-12-14 00:56:57'),
(227, '2021-12-13', 18, 37, 12, 10, 74, '2021-12-14 00:56:16', '2021-12-14 00:57:00'),
(228, '2021-12-13', 20, 38, 12, 10, 70, '2021-12-14 00:56:16', '2021-12-21 23:37:44'),
(229, '2021-12-13', 18, 38, 12, 10, 71, '2021-12-14 00:56:16', '2021-12-14 00:57:04'),
(230, '2021-12-13', 20, 38, 12, 10, 72, '2021-12-14 00:56:16', '2021-12-14 00:57:07'),
(231, '2021-12-13', 20, 38, 12, 10, 73, '2021-12-14 00:56:16', '2021-12-14 00:57:05'),
(232, '2021-12-13', 2, 38, 12, 10, 74, '2021-12-14 00:56:16', '2021-12-14 00:57:08'),
(233, '2021-12-13', 20, 39, 12, 10, 70, '2021-12-14 00:56:16', '2021-12-14 00:57:34'),
(234, '2021-12-13', 20, 39, 12, 10, 71, '2021-12-14 00:56:16', '2021-12-14 00:57:23'),
(235, '2021-12-13', 18, 39, 12, 10, 72, '2021-12-14 00:56:16', '2021-12-14 00:57:29'),
(236, '2021-12-13', 20, 39, 12, 10, 73, '2021-12-14 00:56:16', '2021-12-14 00:57:26'),
(237, '2021-12-13', 18, 39, 12, 10, 74, '2021-12-14 00:56:16', '2021-12-14 00:57:31'),
(238, '2021-12-21', 20, 35, 12, 7, 75, '2021-12-21 23:59:53', '2021-12-22 00:02:56'),
(239, '2021-12-21', 20, 35, 12, 7, 76, '2021-12-21 23:59:53', '2021-12-22 00:04:07'),
(240, '2021-12-21', 20, 35, 12, 7, 77, '2021-12-21 23:59:53', '2021-12-22 00:02:55'),
(241, '2021-12-21', 10, 35, 12, 7, 78, '2021-12-21 23:59:53', '2021-12-22 00:04:12'),
(242, '2021-12-21', 20, 35, 12, 7, 79, '2021-12-21 23:59:53', '2021-12-22 00:04:20'),
(243, '2021-12-21', 20, 36, 12, 7, 75, '2021-12-21 23:59:53', '2021-12-22 00:02:59'),
(244, '2021-12-21', 20, 36, 12, 7, 76, '2021-12-21 23:59:53', '2021-12-22 00:04:08'),
(245, '2021-12-21', 20, 36, 12, 7, 77, '2021-12-21 23:59:53', '2021-12-22 00:02:54'),
(246, '2021-12-21', 10, 36, 12, 7, 78, '2021-12-21 23:59:53', '2021-12-22 00:04:14'),
(247, '2021-12-21', 20, 36, 12, 7, 79, '2021-12-21 23:59:53', '2021-12-22 00:04:20'),
(248, '2021-12-21', 20, 37, 12, 7, 75, '2021-12-21 23:59:53', '2021-12-22 00:03:00'),
(249, '2021-12-21', 20, 37, 12, 7, 76, '2021-12-21 23:59:53', '2021-12-22 00:04:08'),
(250, '2021-12-21', 20, 37, 12, 7, 77, '2021-12-21 23:59:53', '2021-12-22 00:02:54'),
(251, '2021-12-21', 10, 37, 12, 7, 78, '2021-12-21 23:59:53', '2021-12-22 00:04:13'),
(252, '2021-12-21', 20, 37, 12, 7, 79, '2021-12-21 23:59:53', '2021-12-22 00:04:19'),
(253, '2021-12-21', 20, 38, 12, 7, 75, '2021-12-21 23:59:53', '2021-12-22 00:03:01'),
(254, '2021-12-21', 20, 38, 12, 7, 76, '2021-12-21 23:59:53', '2021-12-22 00:02:47'),
(255, '2021-12-21', 20, 38, 12, 7, 77, '2021-12-21 23:59:53', '2021-12-22 00:02:53'),
(256, '2021-12-21', 10, 38, 12, 7, 78, '2021-12-21 23:59:53', '2021-12-22 00:04:15'),
(257, '2021-12-21', 20, 38, 12, 7, 79, '2021-12-21 23:59:53', '2021-12-22 00:04:18'),
(258, '2021-12-21', 20, 39, 12, 7, 75, '2021-12-21 23:59:53', '2021-12-22 00:03:01'),
(259, '2021-12-21', 20, 39, 12, 7, 76, '2021-12-21 23:59:53', '2021-12-22 00:02:50'),
(260, '2021-12-21', 20, 39, 12, 7, 77, '2021-12-21 23:59:53', '2021-12-22 00:02:51'),
(261, '2021-12-21', 10, 39, 12, 7, 78, '2021-12-21 23:59:53', '2021-12-22 00:04:16'),
(262, '2021-12-21', 20, 39, 12, 7, 79, '2021-12-21 23:59:53', '2021-12-22 00:04:17'),
(263, '2021-12-21', 20, 35, 12, 13, 80, '2021-12-22 00:01:29', '2021-12-22 00:02:10'),
(264, '2021-12-21', 20, 35, 12, 13, 81, '2021-12-22 00:01:29', '2021-12-22 00:02:03'),
(265, '2021-12-21', 10, 35, 12, 13, 82, '2021-12-22 00:01:29', '2021-12-22 00:01:57'),
(266, '2021-12-21', 20, 35, 12, 13, 83, '2021-12-22 00:01:29', '2021-12-22 00:01:48'),
(267, '2021-12-21', 20, 35, 12, 13, 84, '2021-12-22 00:01:29', '2021-12-22 00:01:55'),
(268, '2021-12-21', 20, 36, 12, 13, 80, '2021-12-22 00:01:29', '2021-12-22 00:02:11'),
(269, '2021-12-21', 20, 36, 12, 13, 81, '2021-12-22 00:01:29', '2021-12-22 00:02:04'),
(270, '2021-12-21', 20, 36, 12, 13, 82, '2021-12-22 00:01:29', '2021-12-22 00:02:08'),
(271, '2021-12-21', 20, 36, 12, 13, 83, '2021-12-22 00:01:29', '2021-12-22 00:01:49'),
(272, '2021-12-21', 20, 36, 12, 13, 84, '2021-12-22 00:01:29', '2021-12-22 00:01:55'),
(273, '2021-12-21', 20, 37, 12, 13, 80, '2021-12-22 00:01:29', '2021-12-22 00:02:11'),
(274, '2021-12-21', 20, 37, 12, 13, 81, '2021-12-22 00:01:29', '2021-12-22 00:02:05'),
(275, '2021-12-21', 10, 37, 12, 13, 82, '2021-12-22 00:01:29', '2021-12-22 00:01:58'),
(276, '2021-12-21', 20, 37, 12, 13, 83, '2021-12-22 00:01:29', '2021-12-22 00:01:50'),
(277, '2021-12-21', 20, 37, 12, 13, 84, '2021-12-22 00:01:29', '2021-12-22 00:01:54'),
(278, '2021-12-21', 20, 38, 12, 13, 80, '2021-12-22 00:01:29', '2021-12-22 00:02:12'),
(279, '2021-12-21', 20, 38, 12, 13, 81, '2021-12-22 00:01:29', '2021-12-22 00:02:06'),
(280, '2021-12-21', 20, 38, 12, 13, 82, '2021-12-22 00:01:29', '2021-12-22 00:02:09'),
(281, '2021-12-21', 20, 38, 12, 13, 83, '2021-12-22 00:01:29', '2021-12-22 00:01:51'),
(282, '2021-12-21', 20, 38, 12, 13, 84, '2021-12-22 00:01:29', '2021-12-22 00:01:53'),
(283, '2021-12-21', 20, 39, 12, 13, 80, '2021-12-22 00:01:29', '2021-12-22 00:02:13'),
(284, '2021-12-21', 20, 39, 12, 13, 81, '2021-12-22 00:01:29', '2021-12-22 00:02:07'),
(285, '2021-12-21', 10, 39, 12, 13, 82, '2021-12-22 00:01:29', '2021-12-22 00:02:02'),
(286, '2021-12-21', 20, 39, 12, 13, 83, '2021-12-22 00:01:29', '2021-12-22 00:01:51'),
(287, '2021-12-21', 20, 39, 12, 13, 84, '2021-12-22 00:01:29', '2021-12-22 00:01:52'),
(288, '2021-12-21', 10, 35, 12, 4, 85, '2021-12-22 00:10:59', '2021-12-22 00:13:21'),
(289, '2021-12-21', 10, 35, 12, 4, 86, '2021-12-22 00:10:59', '2021-12-22 00:12:59'),
(290, '2021-12-21', 0, 35, 12, 4, 87, '2021-12-22 00:10:59', '2021-12-22 00:13:10'),
(291, '2021-12-21', 10, 35, 12, 4, 88, '2021-12-22 00:10:59', '2021-12-22 00:12:56'),
(292, '2021-12-21', 20, 35, 12, 4, 89, '2021-12-22 00:10:59', '2021-12-22 00:12:47'),
(293, '2021-12-21', 10, 36, 12, 4, 85, '2021-12-22 00:10:59', '2021-12-22 00:13:20'),
(294, '2021-12-21', 10, 36, 12, 4, 86, '2021-12-22 00:10:59', '2021-12-22 00:13:00'),
(295, '2021-12-21', 10, 36, 12, 4, 87, '2021-12-22 00:10:59', '2021-12-22 00:13:08'),
(296, '2021-12-21', 10, 36, 12, 4, 88, '2021-12-22 00:10:59', '2021-12-22 00:12:55'),
(297, '2021-12-21', 10, 36, 12, 4, 89, '2021-12-22 00:10:59', '2021-12-22 00:12:50'),
(298, '2021-12-21', 10, 37, 12, 4, 85, '2021-12-22 00:10:59', '2021-12-22 00:13:19'),
(299, '2021-12-21', 10, 37, 12, 4, 86, '2021-12-22 00:10:59', '2021-12-22 00:13:03'),
(300, '2021-12-21', 10, 37, 12, 4, 87, '2021-12-22 00:10:59', '2021-12-22 00:13:07'),
(301, '2021-12-21', 10, 37, 12, 4, 88, '2021-12-22 00:10:59', '2021-12-22 00:12:53'),
(302, '2021-12-21', 10, 37, 12, 4, 89, '2021-12-22 00:10:59', '2021-12-22 00:12:51'),
(303, '2021-12-21', 20, 38, 12, 4, 85, '2021-12-22 00:10:59', '2021-12-22 00:13:18'),
(304, '2021-12-21', 20, 38, 12, 4, 86, '2021-12-22 00:10:59', '2021-12-22 00:13:04'),
(305, '2021-12-21', 20, 38, 12, 4, 87, '2021-12-22 00:10:59', '2021-12-22 00:13:06'),
(306, '2021-12-21', 10, 38, 12, 4, 88, '2021-12-22 00:10:59', '2021-12-22 00:12:54'),
(307, '2021-12-21', 10, 38, 12, 4, 89, '2021-12-22 00:10:59', '2021-12-22 00:12:51'),
(308, '2021-12-21', 20, 39, 12, 4, 85, '2021-12-22 00:10:59', '2021-12-24 08:53:34'),
(309, '2021-12-21', 20, 39, 12, 4, 86, '2021-12-22 00:10:59', '2021-12-22 00:13:05'),
(310, '2021-12-21', 20, 39, 12, 4, 87, '2021-12-22 00:10:59', '2021-12-24 08:53:41'),
(311, '2021-12-21', 20, 39, 12, 4, 88, '2021-12-22 00:10:59', '2021-12-24 08:53:46'),
(312, '2021-12-21', 10, 39, 12, 4, 89, '2021-12-22 00:10:59', '2021-12-22 00:12:52'),
(313, '2021-12-21', 20, 35, 12, 5, 90, '2021-12-22 00:11:58', '2021-12-22 00:12:35'),
(314, '2021-12-21', 20, 35, 12, 5, 91, '2021-12-22 00:11:58', '2021-12-22 00:12:21'),
(315, '2021-12-21', 15, 35, 12, 5, 92, '2021-12-22 00:11:58', '2021-12-22 00:12:09'),
(316, '2021-12-21', 20, 35, 12, 5, 93, '2021-12-22 00:11:58', '2021-12-22 00:12:24'),
(317, '2021-12-21', 20, 35, 12, 5, 94, '2021-12-22 00:11:58', '2021-12-22 00:12:30'),
(318, '2021-12-21', 20, 36, 12, 5, 90, '2021-12-22 00:11:58', '2021-12-22 00:12:35'),
(319, '2021-12-21', 20, 36, 12, 5, 91, '2021-12-22 00:11:58', '2021-12-22 00:12:20'),
(320, '2021-12-21', 15, 36, 12, 5, 92, '2021-12-22 00:11:58', '2021-12-22 00:12:11'),
(321, '2021-12-21', 20, 36, 12, 5, 93, '2021-12-22 00:11:58', '2021-12-22 00:12:24'),
(322, '2021-12-21', 20, 36, 12, 5, 94, '2021-12-22 00:11:58', '2021-12-22 00:12:31'),
(323, '2021-12-21', 0, 37, 12, 5, 90, '2021-12-22 00:11:58', '2021-12-22 00:11:58'),
(324, '2021-12-21', 10, 37, 12, 5, 91, '2021-12-22 00:11:58', '2021-12-22 00:12:18'),
(325, '2021-12-21', 15, 37, 12, 5, 92, '2021-12-22 00:11:58', '2021-12-22 00:12:12'),
(326, '2021-12-21', 20, 37, 12, 5, 93, '2021-12-22 00:11:58', '2021-12-22 00:12:25'),
(327, '2021-12-21', 20, 37, 12, 5, 94, '2021-12-22 00:11:58', '2021-12-22 00:12:33'),
(328, '2021-12-21', 0, 38, 12, 5, 90, '2021-12-22 00:11:58', '2021-12-22 00:11:58'),
(329, '2021-12-21', 15, 38, 12, 5, 91, '2021-12-22 00:11:58', '2021-12-22 00:12:16'),
(330, '2021-12-21', 15, 38, 12, 5, 92, '2021-12-22 00:11:58', '2021-12-22 00:12:15'),
(331, '2021-12-21', 20, 38, 12, 5, 93, '2021-12-22 00:11:58', '2021-12-22 00:12:26'),
(332, '2021-12-21', 20, 38, 12, 5, 94, '2021-12-22 00:11:58', '2021-12-22 00:12:27'),
(333, '2021-12-21', 0, 39, 12, 5, 90, '2021-12-22 00:11:58', '2021-12-22 00:11:58'),
(334, '2021-12-21', 20, 39, 12, 5, 91, '2021-12-22 00:11:58', '2021-12-22 00:12:22'),
(335, '2021-12-21', 15, 39, 12, 5, 92, '2021-12-22 00:11:58', '2021-12-22 00:12:15'),
(336, '2021-12-21', 20, 39, 12, 5, 93, '2021-12-22 00:11:58', '2021-12-22 00:12:28'),
(337, '2021-12-21', 20, 39, 12, 5, 94, '2021-12-22 00:11:58', '2021-12-22 00:12:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom_mat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nhor_mat` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id`, `nom_mat`, `nhor_mat`, `created_at`, `updated_at`) VALUES
(1, 'Transito Aéreo', 25, '2021-09-30 01:11:19', '2021-09-30 01:11:19'),
(2, 'Procedimientos operaciones POV', 25, '2021-09-30 01:11:32', '2021-09-30 01:11:32'),
(3, 'Reglamento del aire', 45, '2021-09-30 01:11:55', '2021-09-30 01:11:55'),
(4, 'Servicio de control de tránsito aéreo', 2, '2021-10-01 06:15:45', '2021-10-01 06:15:45'),
(5, 'Control de aerodromo', 25, '2021-10-01 06:16:27', '2021-10-01 06:16:27'),
(6, 'Meteorología Aeronautica', 25, '2021-10-01 06:19:28', '2021-10-01 06:19:28'),
(7, 'Seguridad aérea', 25, '2021-10-01 06:19:41', '2021-10-01 06:19:41'),
(8, 'Seguridad de la aviación para tripulantes', 25, '2021-10-01 06:20:18', '2021-10-01 06:20:18'),
(9, 'Bioseguridad Aérea', 25, '2021-10-01 06:20:40', '2021-10-01 06:20:40'),
(10, 'Servicios de aeropuertos', 35, '2021-10-01 06:21:08', '2021-10-01 06:21:08'),
(11, 'Sistemas y componentes aéreos', 25, '2021-10-01 06:22:01', '2021-10-01 06:22:01'),
(12, 'Simulador de Vuelo', 25, '2021-10-01 06:22:16', '2021-10-01 06:22:16'),
(13, 'Administración de las operaciones', 25, '2021-10-01 06:22:39', '2021-10-01 06:22:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriculas`
--

CREATE TABLE `matriculas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `feins_matri` date NOT NULL,
  `periodo_id` bigint(20) UNSIGNED NOT NULL,
  `alumno_id` bigint(20) UNSIGNED NOT NULL,
  `curso_id` bigint(20) UNSIGNED NOT NULL,
  `seccion_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `matriculas`
--

INSERT INTO `matriculas` (`id`, `feins_matri`, `periodo_id`, `alumno_id`, `curso_id`, `seccion_id`, `created_at`, `updated_at`) VALUES
(26, '2021-12-02', 12, 35, 4, 1, '2021-12-14 00:37:32', '2021-12-14 00:37:32'),
(27, '2021-12-01', 12, 36, 4, 1, '2021-12-14 00:37:44', '2021-12-14 00:37:44'),
(28, '2021-12-01', 12, 37, 4, 1, '2021-12-14 00:37:57', '2021-12-14 00:37:57'),
(29, '2021-12-01', 12, 38, 4, 1, '2021-12-14 00:38:13', '2021-12-14 00:38:13'),
(30, '2021-12-01', 12, 39, 4, 1, '2021-12-14 00:38:27', '2021-12-14 00:38:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_03_26_005650_create_tipogrados_table', 1),
(5, '2021_03_26_005743_create_repartos_table', 1),
(6, '2021_03_26_005815_create_especialidads_table', 1),
(7, '2021_03_26_005854_create_tiposangres_table', 1),
(8, '2021_03_27_002816_create_periodos_table', 1),
(9, '2021_03_27_005717_create_tipocursos_table', 1),
(10, '2021_03_27_005922_create_ejecursos_table', 1),
(11, '2021_03_28_002151_create_docentes_table', 1),
(12, '2021_03_28_002234_create_materias_table', 1),
(13, '2021_03_28_002313_create_cursos_table', 1),
(14, '2021_03_28_002515_create_seccions_table', 1),
(15, '2021_03_28_002854_create_planestudios_table', 1),
(16, '2021_03_28_003054_create_aulas_table', 1),
(17, '2021_03_28_005959_create_modalidadcursos_table', 1),
(18, '2021_04_05_154000_create_alumnos_table', 1),
(19, '2021_05_20_185624_create_permission_tables', 1),
(20, '2021_05_21_175330_create_curso_materia_table', 1),
(21, '2021_07_03_002724_create_matriculas_table', 1),
(22, '2021_07_07_002951_create_asignadocs_table', 1),
(23, '2021_07_08_203646_create_planevas_table', 1),
(24, '2021_07_08_203738_create_detalplanevas_table', 1),
(25, '2021_07_08_203911_create_evaluacions_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidadcursos`
--

CREATE TABLE `modalidadcursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom_moda` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_moda` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ano_per` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peri_per` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finic_per` date NOT NULL,
  `ffin_per` date NOT NULL,
  `estado` enum('En curso','Finalizado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `periodos`
--

INSERT INTO `periodos` (`id`, `ano_per`, `peri_per`, `finic_per`, `ffin_per`, `estado`, `created_at`, `updated_at`) VALUES
(3, '2021', 'Septiembre-Noviembre', '2021-09-01', '2021-11-15', 'En curso', '2021-10-01 06:36:01', '2021-11-20 01:35:53'),
(4, '2021', 'Agosto-Agosto', '2021-08-09', '2021-08-30', 'En curso', '2021-10-01 06:36:22', '2021-11-20 02:25:41'),
(5, '2021', 'Octubre-Noviembre', '2021-10-01', '2021-11-15', 'En curso', '2021-10-01 06:37:00', '2021-10-01 06:37:00'),
(6, '2020', 'Octubre-Noviembre', '2021-11-01', '2022-01-06', 'En curso', '2021-11-07 21:04:38', '2021-11-07 21:04:38'),
(11, '2021', 'Noviembre-Enero', '2021-11-19', '2022-01-19', 'En curso', '2021-11-20 03:10:58', '2021-11-20 03:22:43'),
(12, '2021', 'Noviembre-Diciembre', '2021-11-01', '2021-12-22', 'En curso', '2021-12-14 00:37:00', '2021-12-14 00:37:00'),
(13, 'asas', 'asas', '2021-12-10', '2021-12-16', 'En curso', '2021-12-28 09:53:17', '2021-12-28 09:53:17'),
(14, '33', 'Abril-Agosto', '2021-12-02', '2021-12-02', 'En curso', '2021-12-28 10:01:17', '2021-12-28 10:01:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planestudios`
--

CREATE TABLE `planestudios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tit_pla` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descrip_pla` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `archi_pla` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `curso_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planevas`
--

CREATE TABLE `planevas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecent_plaeva` date NOT NULL,
  `docente_id` bigint(20) UNSIGNED NOT NULL,
  `periodo_id` bigint(20) UNSIGNED NOT NULL,
  `materia_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `planevas`
--

INSERT INTO `planevas` (`id`, `fecent_plaeva`, `docente_id`, `periodo_id`, `materia_id`, `created_at`, `updated_at`) VALUES
(45, '2021-12-10', 20, 11, 2, '2021-12-10 19:00:01', '2021-12-10 19:00:01'),
(46, '2021-12-17', 20, 11, 2, '2021-12-10 19:00:25', '2021-12-10 19:00:25'),
(47, '2021-12-21', 20, 11, 2, '2021-12-10 19:00:41', '2021-12-10 19:00:41'),
(48, '2021-12-20', 20, 11, 2, '2021-12-10 19:00:55', '2021-12-10 19:00:55'),
(49, '2021-12-24', 20, 11, 2, '2021-12-10 19:01:06', '2021-12-10 19:01:06'),
(50, '2021-12-13', 20, 11, 5, '2021-12-13 20:28:39', '2021-12-13 20:28:39'),
(51, '2021-12-15', 20, 11, 5, '2021-12-13 20:28:51', '2021-12-13 20:28:51'),
(52, '2021-12-20', 20, 11, 5, '2021-12-13 20:29:01', '2021-12-13 20:29:01'),
(55, '2021-12-13', 20, 11, 3, '2021-12-13 20:38:32', '2021-12-13 20:38:32'),
(56, '2021-12-15', 20, 11, 3, '2021-12-13 20:38:40', '2021-12-13 20:38:40'),
(57, '2021-11-09', 22, 12, 11, '2021-12-14 00:43:55', '2021-12-14 00:43:55'),
(58, '2021-11-17', 22, 12, 11, '2021-12-14 00:44:08', '2021-12-14 00:44:08'),
(59, '2021-11-26', 22, 12, 11, '2021-12-14 00:44:32', '2021-12-14 00:44:32'),
(60, '2021-12-09', 22, 12, 11, '2021-12-14 00:44:46', '2021-12-14 00:44:46'),
(61, '2021-12-17', 22, 12, 11, '2021-12-14 00:44:59', '2021-12-14 00:44:59'),
(62, '2021-12-16', 23, 12, 10, '2021-12-14 00:54:31', '2021-12-14 00:54:31'),
(63, '2021-12-17', 23, 12, 10, '2021-12-14 00:55:05', '2021-12-14 00:55:05'),
(64, '2021-12-23', 23, 12, 10, '2021-12-14 00:55:23', '2021-12-14 00:55:23'),
(65, '2021-12-31', 23, 12, 10, '2021-12-14 00:55:39', '2021-12-14 00:55:39'),
(66, '2021-12-28', 23, 12, 10, '2021-12-14 00:56:13', '2021-12-14 00:56:13'),
(67, '2021-12-03', 22, 12, 7, '2021-12-21 23:58:54', '2021-12-21 23:58:54'),
(68, '2021-12-10', 22, 12, 7, '2021-12-21 23:59:11', '2021-12-21 23:59:11'),
(69, '2021-12-24', 22, 12, 7, '2021-12-21 23:59:23', '2021-12-21 23:59:23'),
(70, '2021-12-25', 22, 12, 7, '2021-12-21 23:59:36', '2021-12-21 23:59:36'),
(71, '2021-12-31', 22, 12, 7, '2021-12-21 23:59:50', '2021-12-21 23:59:50'),
(72, '2021-12-01', 21, 12, 13, '2021-12-22 00:00:20', '2021-12-22 00:00:20'),
(73, '2021-12-15', 21, 12, 13, '2021-12-22 00:00:30', '2021-12-22 00:00:30'),
(74, '2021-12-10', 21, 12, 13, '2021-12-22 00:00:44', '2021-12-22 00:00:44'),
(75, '2021-12-16', 21, 12, 13, '2021-12-22 00:00:59', '2021-12-22 00:00:59'),
(76, '2021-12-30', 21, 12, 13, '2021-12-22 00:01:27', '2021-12-22 00:01:27'),
(77, '2021-12-09', 24, 12, 4, '2021-12-22 00:10:08', '2021-12-22 00:10:08'),
(78, '2021-12-16', 24, 12, 4, '2021-12-22 00:10:22', '2021-12-22 00:10:22'),
(79, '2021-12-19', 24, 12, 4, '2021-12-22 00:10:29', '2021-12-22 00:10:29'),
(80, '2021-12-18', 24, 12, 4, '2021-12-22 00:10:45', '2021-12-22 00:10:45'),
(81, '2021-12-10', 24, 12, 4, '2021-12-22 00:10:56', '2021-12-22 00:10:56'),
(82, '2021-12-20', 25, 12, 5, '2021-12-22 00:11:12', '2021-12-22 00:11:12'),
(83, '2021-12-24', 25, 12, 5, '2021-12-22 00:11:24', '2021-12-22 00:11:24'),
(84, '2021-12-23', 25, 12, 5, '2021-12-22 00:11:32', '2021-12-22 00:11:32'),
(85, '2021-12-15', 25, 12, 5, '2021-12-22 00:11:42', '2021-12-22 00:11:42'),
(86, '2021-12-19', 25, 12, 5, '2021-12-22 00:11:55', '2021-12-22 00:11:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `porcentaje_notas`
--

CREATE TABLE `porcentaje_notas` (
  `id` int(11) NOT NULL,
  `porcentaje_individual` decimal(6,2) NOT NULL,
  `porcentaje_grupal` decimal(6,2) NOT NULL,
  `porcentaje_actitudinal` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `porcentaje_notas`
--

INSERT INTO `porcentaje_notas` (`id`, `porcentaje_individual`, `porcentaje_grupal`, `porcentaje_actitudinal`) VALUES
(1, '60.00', '30.00', '10.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartos`
--

CREATE TABLE `repartos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom_reparto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_reparto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `repartos`
--

INSERT INTO `repartos` (`id`, `nom_reparto`, `desc_reparto`, `created_at`, `updated_at`) VALUES
(1, 'COAD', 'Comando de Educación y Doctrina', '2021-09-30 01:06:33', '2021-09-30 01:06:33'),
(3, 'ESMA', 'Escuela de la fuerza aerea', '2021-10-01 05:57:45', '2021-10-01 05:57:45'),
(4, 'ESPE', 'Escuela Superior Politecnica', '2021-10-01 05:57:52', '2021-10-01 05:57:52'),
(5, 'UEFAE', 'Unidad Educativa de la Fuerza Aérea', '2021-10-01 05:58:20', '2021-10-01 05:58:20'),
(6, 'Ala Nro 22', 'Ala de Combate aéreo Nro 22', '2021-10-01 05:58:41', '2021-10-01 05:58:57'),
(7, 'Comando General', 'Comando General', '2021-10-01 05:59:09', '2021-10-01 05:59:09'),
(8, 'Omitido', 'Ninguno', '2021-10-01 06:33:49', '2021-10-01 06:33:49'),
(9, 'COAD', 'wefwef', '2021-11-07 21:25:14', '2021-11-07 21:25:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', '', NULL, NULL),
(2, 'Docente', '', NULL, NULL),
(3, 'Estudiante', '', NULL, NULL),
(4, 'Técnico', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_user`
--

CREATE TABLE `role_user` (
  `id` int(11) NOT NULL,
  `id_rol` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `role_user`
--

INSERT INTO `role_user` (`id`, `id_rol`, `id_user`, `created_at`, `updated_at`) VALUES
(3, 1, 8, '2021-11-29 22:02:58', '2021-11-29 22:02:58'),
(21, 4, 39, '2021-11-30 14:06:21', '2021-11-30 14:06:21'),
(27, 3, 41, '2021-12-13 19:31:19', '2021-12-13 19:31:19'),
(33, 2, 40, '2021-12-13 19:49:49', '2021-12-13 19:49:49'),
(34, 3, 40, '2021-12-13 19:49:49', '2021-12-13 19:49:49'),
(36, 3, 38, '2021-12-18 13:20:30', '2021-12-18 13:20:30'),
(44, 3, 43, '2021-12-20 04:14:50', '2021-12-20 04:14:50'),
(46, 2, 44, '2021-12-21 18:39:01', '2021-12-21 18:39:01'),
(47, 2, 45, '2021-12-21 19:06:23', '2021-12-21 19:06:23'),
(48, 2, 46, '2021-12-21 19:07:38', '2021-12-21 19:07:38'),
(49, 2, 42, '2021-12-21 19:18:38', '2021-12-21 19:18:38'),
(50, 3, 42, '2021-12-21 19:18:38', '2021-12-21 19:18:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccions`
--

CREATE TABLE `seccions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cod_sec` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_sec` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `seccions`
--

INSERT INTO `seccions` (`id`, `cod_sec`, `nom_sec`, `created_at`, `updated_at`) VALUES
(1, 'S001', 'OPERACIONES', '2021-09-30 01:10:28', '2021-10-01 06:12:41'),
(2, 'S002', 'LOGISTICA', '2021-09-30 01:10:42', '2021-09-30 01:10:42'),
(3, 'S003', 'ABASTECIMIENTOS', '2021-10-01 06:12:58', '2021-10-01 06:12:58'),
(4, 'S004', 'RR.HH', '2021-10-01 06:13:16', '2021-10-01 06:13:16'),
(5, 'A001', 'assa', '2021-12-27 20:16:27', '2021-12-27 20:16:27'),
(6, 'asas', 'assa', '2021-12-27 20:16:32', '2021-12-27 20:16:32'),
(7, 'sasas', 'asasa', '2021-12-27 20:16:37', '2021-12-27 20:16:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocursos`
--

CREATE TABLE `tipocursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom_curso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_curso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipocursos`
--

INSERT INTO `tipocursos` (`id`, `nom_curso`, `desc_curso`, `created_at`, `updated_at`) VALUES
(1, 'Capacitación', 'Capacitación de nuevas tripulaciones', '2021-09-30 01:08:20', '2021-09-30 01:08:20'),
(2, 'Especialización', 'Especialización de nuevas herramientas', '2021-09-30 01:08:30', '2021-09-30 01:08:30'),
(3, 'Formación', 'Formación de nuevas tripulaciones para el empleo de sistemas aéreos', '2021-10-01 06:08:36', '2021-10-01 06:08:36'),
(4, 'Seminarios', 'Seminarios para nuevas competencias', '2021-10-01 06:09:03', '2021-10-01 06:09:03'),
(5, 'Talleres', 'Talleres de conocimientos', '2021-10-01 06:09:24', '2021-10-01 06:09:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipogrados`
--

CREATE TABLE `tipogrados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom_grado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_grado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipogrados`
--

INSERT INTO `tipogrados` (`id`, `nom_grado`, `desc_grado`, `created_at`, `updated_at`) VALUES
(1, 'Cbop', 'Cabo  Primero. Téc. Avc', '2021-09-30 01:07:19', '2021-09-30 01:07:19'),
(2, 'Sldo', 'Soldado. Téc. Avc', '2021-10-01 06:06:36', '2021-10-01 06:06:36'),
(3, 'Sgos', 'Sargento . Téc. Avc', '2021-10-01 06:06:44', '2021-10-01 06:06:44'),
(4, 'Subs', 'Sub Oficial Segundo. Tec. avc', '2021-10-01 06:06:57', '2021-10-01 06:06:57'),
(5, 'Tnte', 'Teniente. Téc. Avc', '2021-10-01 06:07:10', '2021-10-01 06:07:10'),
(6, 'Capt', 'Capitan. Téc. Avc', '2021-10-01 06:07:38', '2021-10-01 06:07:38'),
(7, 'Mayor', 'Mayor Tec. Avc', '2021-10-01 06:08:10', '2021-10-01 06:08:10'),
(8, 'Crnl', 'Coronel. Téc. Avc', '2021-10-01 06:34:27', '2021-10-01 06:34:27'),
(9, 'Subt', 'Subteniente. Tec. Avc', '2021-10-01 06:34:51', '2021-10-01 06:34:51'),
(10, 'Omitido', 'Ninguno', '2021-10-01 06:49:00', '2021-10-01 06:49:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposangres`
--

CREATE TABLE `tiposangres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom_sangre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_sangre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tiposangres`
--

INSERT INTO `tiposangres` (`id`, `nom_sangre`, `desc_sangre`, `created_at`, `updated_at`) VALUES
(1, '+O', 'Positivo', '2021-09-30 01:09:14', '2021-09-30 01:09:14'),
(2, '-O', 'Negativo', '2021-09-30 01:09:22', '2021-09-30 01:09:22'),
(3, '+B', 'Negativo', '2021-10-01 06:09:57', '2021-10-01 06:09:57'),
(4, '-O', 'Positivo', '2021-10-01 06:10:06', '2021-10-01 06:10:06'),
(5, '-AB', 'Negativo', '2021-10-01 06:11:09', '2021-10-01 06:11:09'),
(6, '+AB', 'Positivo', '2021-10-01 06:11:24', '2021-10-01 06:11:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` enum('Activo','Inactivo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `dni`, `name`, `lastname`, `email`, `password`, `state`, `created_at`, `updated_at`) VALUES
(8, '00000000', 'administrador', '', 'administrador@gmail.com', '$2y$10$Wh2hD5pjkFHcBZD6f9gX9OTByo3iuSyZXt.u7iawA8e1nGeC/wvTW', 'Activo', '2021-10-16 07:09:22', '2021-11-26 17:18:55'),
(38, '1804777595', 'Edwin Vladimir', 'Guano Cunalata', 'eguano@fae.mil.ec', '$2y$10$L3A3BwcTvMVTSU07Np1r5.XvcQgMZv5Z.eF87PLlLe15/9ZUv7p7.', 'Activo', '2021-11-30 16:49:13', '2021-12-14 00:29:52'),
(39, '12345678', 'tecnico', 'tecnico', 'tecnico@gmail.com', '$2y$10$zH6q0ql0Z6YVEQUdDYB3AOKKHbMQQZ1lU4isYSX0h27liuTr6.iK.', 'Activo', '2021-11-30 19:06:21', '2021-11-30 19:06:21'),
(40, '7896541235', 'Anabel Pamela', 'Tite Aman', 'atite@fae.mil.ec', '$2y$10$jKbpNCd.odgg.qnYtAzpeOGMLjdROPpJ29EFQffzhOb6m7FIoHL.u', 'Activo', '2021-11-30 19:07:06', '2021-12-14 00:33:51'),
(41, '1597532584', 'Sandra Elizabeth', 'Sanchez Carrasco', 'ssanchez@fae.mil.ec', '$2y$10$my0PcJ3Q6NyhM3ySNsAeV.1TpLyQfHJ855843IEG5bqcrylDTUiEq', 'Activo', '2021-12-14 00:31:19', '2021-12-14 00:31:19'),
(42, '7412589630', 'Juan Andres', 'Carrasco Alvarado', 'jcarrasco@fae.mil.ec', '$2y$10$88UVTq6JzJQCgX2cFyug5eYnzV0dSbMOkWXhLsRiWw9ExWOucSAt2', 'Activo', '2021-12-14 00:32:03', '2021-12-14 00:32:03'),
(43, '7894561235', 'Sandra Anabel', 'Suarez Aman', 'ssuarez@fae.mil.ec', '$2y$10$fAIrYisPL4K6/.wxbqbxm.EkRN2S9yJ0x/ho9HFGwGFQwVNBBBba.', 'Activo', '2021-12-14 00:32:52', '2021-12-14 00:32:52'),
(44, '1854254877', 'Cristian Andres', 'Yanez Ramirez', 'cyanez@fae.mil.ec', '$2y$10$JALzBWBijd1KDhv1HqOSqei2gVa.XJJnlfaql.SyLqTJ556keXuUa', 'Activo', '2021-12-14 00:53:14', '2021-12-20 08:11:57'),
(45, '2587413695', 'Jorge Andres', 'Calderon Suarez', 'jcalderon@fae.mil.ec', '$2y$10$ddEjHFEhqxIPlxa1z0lhJO7OEVSXQ91xFZWSvnGYQalZ1T4gDVMX.', 'Activo', '2021-12-22 00:06:23', '2021-12-22 00:06:23'),
(46, '8521478965', 'Fabian Andres', 'Guano Paredes', 'fguano@fae.mil.ec', '$2y$10$vHIHJH.FOH6YrkIhhm3DTuJS9pTVdR/h3L1kBKq6LeQzRU0lrTWsa', 'Activo', '2021-12-22 00:07:38', '2021-12-22 00:07:38');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumnos_especialidad_id_foreign` (`especialidad_id`),
  ADD KEY `alumnos_tiposangre_id_foreign` (`tiposangre_id`),
  ADD KEY `alumnos_tipogrado_id_foreign` (`tipogrado_id`),
  ADD KEY `alumnos_reparto_id_foreign` (`reparto_id`);

--
-- Indices de la tabla `asignadocs`
--
ALTER TABLE `asignadocs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asignadocs_docente_id_foreign` (`docente_id`),
  ADD KEY `asignadocs_periodo_id_foreign` (`periodo_id`),
  ADD KEY `asignadocs_seccion_id_foreign` (`seccion_id`),
  ADD KEY `asignadocs_materia_id_foreign` (`materia_id`),
  ADD KEY `asignadocs_aula_id_foreign` (`aula_id`);

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cursos_ejecurso_id_foreign` (`ejecurso_id`),
  ADD KEY `cursos_tipocurso_id_foreign` (`tipocurso_id`);

--
-- Indices de la tabla `curso_materia`
--
ALTER TABLE `curso_materia`
  ADD KEY `curso_materia_materia_id_foreign` (`materia_id`),
  ADD KEY `curso_materia_curso_id_foreign` (`curso_id`);

--
-- Indices de la tabla `detalplanevas`
--
ALTER TABLE `detalplanevas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalplanevas_planeva_id_foreign` (`planeva_id`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docentes_tiposangre_id_foreign` (`tiposangre_id`),
  ADD KEY `docentes_tipogrado_id_foreign` (`tipogrado_id`),
  ADD KEY `docentes_especialidad_id_foreign` (`especialidad_id`),
  ADD KEY `docentes_reparto_id_foreign` (`reparto_id`);

--
-- Indices de la tabla `ejecursos`
--
ALTER TABLE `ejecursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `especialidads`
--
ALTER TABLE `especialidads`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluacions`
--
ALTER TABLE `evaluacions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluacions_alumno_id_foreign` (`alumno_id`),
  ADD KEY `evaluacions_periodo_id_foreign` (`periodo_id`),
  ADD KEY `evaluacions_materia_id_foreign` (`materia_id`),
  ADD KEY `evaluacions_detalplaneva_id_foreign` (`detalplaneva_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matriculas_periodo_id_foreign` (`periodo_id`),
  ADD KEY `matriculas_alumno_id_foreign` (`alumno_id`),
  ADD KEY `matriculas_curso_id_foreign` (`curso_id`),
  ADD KEY `matriculas_seccion_id_foreign` (`seccion_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modalidadcursos`
--
ALTER TABLE `modalidadcursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `planestudios`
--
ALTER TABLE `planestudios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `planestudios_curso_id_foreign` (`curso_id`);

--
-- Indices de la tabla `planevas`
--
ALTER TABLE `planevas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `planevas_docente_id_foreign` (`docente_id`),
  ADD KEY `planevas_periodo_id_foreign` (`periodo_id`),
  ADD KEY `planevas_materia_id_foreign` (`materia_id`);

--
-- Indices de la tabla `porcentaje_notas`
--
ALTER TABLE `porcentaje_notas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `repartos`
--
ALTER TABLE `repartos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `seccions`
--
ALTER TABLE `seccions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipocursos`
--
ALTER TABLE `tipocursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipogrados`
--
ALTER TABLE `tipogrados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tiposangres`
--
ALTER TABLE `tiposangres`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `asignadocs`
--
ALTER TABLE `asignadocs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `detalplanevas`
--
ALTER TABLE `detalplanevas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `ejecursos`
--
ALTER TABLE `ejecursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `especialidads`
--
ALTER TABLE `especialidads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `evaluacions`
--
ALTER TABLE `evaluacions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `modalidadcursos`
--
ALTER TABLE `modalidadcursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `periodos`
--
ALTER TABLE `periodos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planestudios`
--
ALTER TABLE `planestudios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planevas`
--
ALTER TABLE `planevas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `porcentaje_notas`
--
ALTER TABLE `porcentaje_notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `repartos`
--
ALTER TABLE `repartos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `seccions`
--
ALTER TABLE `seccions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipocursos`
--
ALTER TABLE `tipocursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipogrados`
--
ALTER TABLE `tipogrados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tiposangres`
--
ALTER TABLE `tiposangres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_especialidad_id_foreign` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidads` (`id`),
  ADD CONSTRAINT `alumnos_reparto_id_foreign` FOREIGN KEY (`reparto_id`) REFERENCES `repartos` (`id`),
  ADD CONSTRAINT `alumnos_tipogrado_id_foreign` FOREIGN KEY (`tipogrado_id`) REFERENCES `tipogrados` (`id`),
  ADD CONSTRAINT `alumnos_tiposangre_id_foreign` FOREIGN KEY (`tiposangre_id`) REFERENCES `tiposangres` (`id`);

--
-- Filtros para la tabla `asignadocs`
--
ALTER TABLE `asignadocs`
  ADD CONSTRAINT `asignadocs_aula_id_foreign` FOREIGN KEY (`aula_id`) REFERENCES `aulas` (`id`),
  ADD CONSTRAINT `asignadocs_docente_id_foreign` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id`),
  ADD CONSTRAINT `asignadocs_materia_id_foreign` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`),
  ADD CONSTRAINT `asignadocs_periodo_id_foreign` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`id`),
  ADD CONSTRAINT `asignadocs_seccion_id_foreign` FOREIGN KEY (`seccion_id`) REFERENCES `seccions` (`id`);

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_ejecurso_id_foreign` FOREIGN KEY (`ejecurso_id`) REFERENCES `ejecursos` (`id`),
  ADD CONSTRAINT `cursos_tipocurso_id_foreign` FOREIGN KEY (`tipocurso_id`) REFERENCES `tipocursos` (`id`);

--
-- Filtros para la tabla `curso_materia`
--
ALTER TABLE `curso_materia`
  ADD CONSTRAINT `curso_materia_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `curso_materia_materia_id_foreign` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalplanevas`
--
ALTER TABLE `detalplanevas`
  ADD CONSTRAINT `detalplanevas_planeva_id_foreign` FOREIGN KEY (`planeva_id`) REFERENCES `planevas` (`id`);

--
-- Filtros para la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `docentes_especialidad_id_foreign` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidads` (`id`),
  ADD CONSTRAINT `docentes_reparto_id_foreign` FOREIGN KEY (`reparto_id`) REFERENCES `repartos` (`id`),
  ADD CONSTRAINT `docentes_tipogrado_id_foreign` FOREIGN KEY (`tipogrado_id`) REFERENCES `tipogrados` (`id`),
  ADD CONSTRAINT `docentes_tiposangre_id_foreign` FOREIGN KEY (`tiposangre_id`) REFERENCES `tiposangres` (`id`);

--
-- Filtros para la tabla `evaluacions`
--
ALTER TABLE `evaluacions`
  ADD CONSTRAINT `evaluacions_alumno_id_foreign` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `evaluacions_detalplaneva_id_foreign` FOREIGN KEY (`detalplaneva_id`) REFERENCES `detalplanevas` (`id`),
  ADD CONSTRAINT `evaluacions_materia_id_foreign` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`),
  ADD CONSTRAINT `evaluacions_periodo_id_foreign` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`id`);

--
-- Filtros para la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `matriculas_alumno_id_foreign` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `matriculas_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `matriculas_periodo_id_foreign` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`id`),
  ADD CONSTRAINT `matriculas_seccion_id_foreign` FOREIGN KEY (`seccion_id`) REFERENCES `seccions` (`id`);

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `planestudios`
--
ALTER TABLE `planestudios`
  ADD CONSTRAINT `planestudios_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `planevas`
--
ALTER TABLE `planevas`
  ADD CONSTRAINT `planevas_docente_id_foreign` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id`),
  ADD CONSTRAINT `planevas_materia_id_foreign` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`),
  ADD CONSTRAINT `planevas_periodo_id_foreign` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`id`);

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
