/*Primer problema:*/

/*1- Elimine la tabla, si existe:*/
 if object_id('empleados') is not null
  drop table empleados;

/*2- Cree la tabla:*/
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  primary key(documento)
 )

/*3- Ingrese algunos registros:*/
 insert into empleados
  values('Juan Perez','22333444','Colon 123','Gerencia',5000,2);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0);
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1);
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3);
 insert into empleados
  values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4);
 insert into empleados
  values('Andres Costa','28444555',default,'Secretaria',null,null);

/*4- Muestre la cantidad de empleados usando "count" (9 empleados)*/
select count(*)
  from empleados

/*5- Muestre la cantidad de empleados con sueldo no nulo de la sección "Secretaria" (2 empleados)*/
select count(sueldo)
  from empleados
  where seccion='Secretaria'

/*6- Muestre el sueldo más alto y el más bajo colocando un alias (5000 y 2000)*/
 select max(sueldo) as 'Mayor sueldo',
  min(sueldo) as 'Menor sueldo'
  from empleados

/*7- Muestre el valor mayor de "cantidadhijos" de los empleados "Perez" (3 hijos)	*/
select max(cantidadhijos)
  from empleados
  where nombre like '%Perez%'

/*8- Muestre el promedio de sueldos de todo los empleados (3400. Note que hay un sueldo nulo y no es 
tenido en cuenta)*/
 select avg(sueldo)
  from empleados

/*9- Muestre el promedio de sueldos de los empleados de la sección "Secretaría" (2100)*/
  select avg(sueldo)
  from empleados
  where seccion='Secretaria'

/*10- Muestre el promedio de hijos de todos los empleados de "Sistemas" (2)*/
 select avg(cantidadhijos)
  from empleados
  where seccion='Sistemas'