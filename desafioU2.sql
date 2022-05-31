--Crear tablas
--Empleados
CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `dni` int(11) DEFAULT NULL,
  `nombre` varchar(55) DEFAULT NULL,
  `apellido` varchar(55) DEFAULT NULL,
  `numero_dto` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- Indexes for table `empleados`
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numero_dto` (`numero_dto`);
--
-- AUTO_INCREMENT for table `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for table `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`numero_dto`) REFERENCES `departamentos` (`numero_dto`);
COMMIT;

--Departamentos
CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `numero_dto` int(4) NOT NULL,
  `departamento` varchar(30) NOT NULL,
  `presupuesto` bigint(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Indexes for table `departamentos`
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_dto` (`numero_dto`);
--
-- AUTO_INCREMENT for table `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

--Insertar registros
INSERT INTO empleados(dni,nombre,apellido,numero_dto)
VALUES
(31096678,"Juan","Lopez",14),
(31096675,"Martin","Zarabia",77),
(34269854,"Jose","velez",77),
(41369852,"Paula","Madariaga",77),
(33698521,"Pedro","Perez",14),
(32698547,"Mariana","Lopez",15),
(42369854,"Abril","Sanchez",37),
(36125896,"Marti","Julia",14),
(36985471,"Omar","Diaz",15),
(32145698,"Guadalupe","Perez",77),
(32369854,"Bernardo","pantera",37),
(36125965,"Lucia","Pesaro",14),
(31236985,"Maria","diamante",14),
(32698547,"Carmen","barbieri",16)

INSERT INTO departamentos(numero_dto,nombre,presupuesto)
VALUES
(14,"Informática",80000),
(77,"Investigación",40000),
(15,"Gestión",95000),
(37,"Desarrollo",65000),
(16,"Comunicación",75000)

--Ejercicios
--2.1 
SELECT apellido FROM empleados;
--2.2 
SELECT DISTINCT apellido FROM empleados;
--2.3 
SELECT * FROM `empleados` WHERE apellido = "lopez";
--2.4 
SELECT * FROM `empleados` WHERE apellido IN ("lopez","perez"); 
--2.5 
SELECT * FROM `empleados` WHERE numero_dto = 14;
--2.6 
SELECT * FROM `empleados` WHERE numero_dto IN (37,77);
--2.7 
SELECT * FROM `empleados` WHERE apellido LIKE "p%";
--2.8 
SELECT SUM(presupuesto) FROM `departamentos`;
--2.9 
SELECT * FROM empleados INNER JOIN departamentos ON empleados.numero_dto = departamentos.numero_dto;
--2.10
 SELECT nombre,apellido,departamento,presupuesto FROM empleados INNER JOIN departamentos ON empleados.numero_dto = departamentos.numero_dto;
--2.11 
SELECT nombre,apellido FROM empleados INNER JOIN departamentos ON empleados.numero_dto = departamentos.numero_dto WHERE presupuesto > 60000;
--2.12 
INSERT INTO departamentos (departamento,numero_dto,presupuesto) VALUES ("Calidad",11,40000);
--2.12 
INSERT INTO empleados (dni,nombre,apellido,numero_dto) VALUES (89267109,"Esther","Vazquez",11);
--2.13 
UPDATE departamentos SET presupuesto = (presupuesto*0.9);
--2.14 
UPDATE empleados SET numero_dto = 14 WHERE numero_dto = 77;
--2.15 
DELETE FROM empleados WHERE numero_dto = 14;
--2.16 
DELETE FROM empleados WHERE empleados.id IN ( SELECT empleados.id FROM empleados INNER JOIN departamentos ON empleados.numero_dto = departamentos.numero_dto WHERE presupuesto > 90000 );
