CREATE DATABASE EMPLEADOS;

USE EMPLEADOS;

CREATE TABLE departamento(
CODIGO_DEPART int(11) NOT NULL,
NOMBRE varchar(20) NOT NULL,
LOCALIDAD varchar(20) DEFAULT NULL,
PRIMARY KEY (CODIGO_DEPART)
); 

INSERT INTO departamento (CODIGO_DEPART, NOMBRE, LOCALIDAD) VALUES
(10, 'CONTABILIDAD', 'SEVILLA'), 
(20, 'INVESTIGACION', 'MADRID'), 
(30, 'VENTAS', 'BARCELONA'), 
(40, 'PRODUCCION', 'BILBAO'); 

CREATE TABLE empleado( 
CODIGO_EMPLEADO int(11) NOT NULL,
APELLIDO varchar(20) NOT NULL,
OFICIO varchar(20) NOT NULL,
DIRECCION int(11) DEFAULT NULL,
FECHA_INGRESO date NOT NULL,
SALARIO int(11) NOT NULL,
COMISION int(11) DEFAULT NULL,
departamento int(11) NOT NULL,
PRIMARY KEY (CODIGO_EMPLEADO),
FOREIGN KEY (departamento) references departamento(CODIGO_DEPART)
ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO empleado (CODIGO_EMPLEADO, APELLIDO, OFICIO, DIRECCION, FECHA_INGRESO, SALARIO, COMISION, departamento) VALUES 
(7369, 'SANCHEZ', 'EMPLEADO', 7902, '1980-12-17', 104000, NULL, 20), 
(7499, 'ARROYO', 'VENDEDOR', 7698, '1980-02-20', 108000, 39000, 30), 
(7521, 'SALA', 'VENDEDOR', 7698, '1981-02-22', 162500, 162500, 30);

/* 2.	Realice las siguientes consultas: */

SELECT apellido, oficio, departamento FROM empleado;

SELECT CODIGO_DEPART, NOMBRE, LOCALIDAD FROM departamento;

SELECT * FROM empleado;

SELECT * FROM empleado order by apellido desc;

SELECT * FROM empleado order by departamento desc;

SELECT * FROM empleado order by departamento, apellido;

SELECT * FROM empleado where salario>200000;

SELECT * FROM empleado where oficio like "ANALISTA";

SELECT apellido, oficio from empleado where departamento=20;

SELECT * FROM empleado order by apellido desc;

SELECT * FROM empleado where oficio like "VENDEDOR" order by apellido;

SELECT * FROM empleado where oficio like "ANALISTA" and departamento=10 order by apellido; 

SELECT * FROM empleado where salario>200000 or departamento=20;

SELECT * FROM empleado order by oficio, apellido;

SELECT * FROM empleado where apellido like "A%";

SELECT * FROM empleado where apellido like "%Z";

SELECT * FROM empleado where apellido like "A%" or apellido like "%E%";

SELECT * FROM empleado where salario between 100000 and 200000;

SELECT * FROM empleado where salario<100000 and oficio like "VENDEDOR";

SELECT * FROM empleado order by departamento, apellido;

SELECT apellido, CODIGO_EMPLEADO FROM empleado where apellido like "%Z" and salario>300000;

SELECT * from departamento where LOCALIDAD like "B%";

SELECT * FROM empleado where salario>100000 and departamento=10 and oficio like "EMPLEADO";

SELECT apellido FROM empleado where comision="null";

SELECT apellido FROM empleado where comision="null" and apellido like "J%";

SELECT apellido FROM empleado where oficio = "VENDEDOR" or oficio = "ANALISTA" or oficio = "EMPLEADO";

SELECT apellido FROM empleado where oficio != "ANALISTA" and oficio != "EMPLEADO";

SELECT * FROM empleado where salario between 200000 and 300000;

SELECT apellido, salario, departamento FROM empleado where salario>200000 and (departamento=20 or departamento=30);

SELECT apellido, CODIGO_EMPLEADO FROM empleado where (salario between 0 and 200000) and (salario between 300000 and 1000000);

SELECT apellido, CODIGO_EMPLEADO FROM empleado where (salario not between 200000 and 300000);

SELECT LOWER(apellido) FROM empleado;

SELECT CONCAT(apellido, oficio) FROM empleado;

SELECT apellido, LENGTH(apellido) FROM empleado order BY LENGTH(apellido) desc; 

SELECT YEAR(FECHA_INGRESO) FROM empleado;

SELECT * FROM empleado where YEAR(FECHA_INGRESO)>1981;

SELECT * FROM empleado where MONTHNAME(FECHA_INGRESO) = "FEBRUARY";

SELECT apellido, MAx(salario), comision FROM empleado;

SELECT * FROM empleado where apellido="A%" and YEAR(FECHA_INGRESO)>1980;

SELECT * FROM empleado where departamento=10 AND comision="null";

/* Ejercicio 2: */ 