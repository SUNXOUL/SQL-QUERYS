
/*Primer problema:*/

/*1- Elimine la tabla, si existe:*/
 if object_id('empleados') is not null
  drop table empleados;

/*2- Cree la tabla:*/
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso datetime,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
 )

/*3- Ingrese algunos registros:*/
 insert into empleados
  values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

/*4- Muestre todos los empleados con apellido "Perez" empleando el operador "like" (3 registros)*/
 select * from empleados
  where nombre like '%Perez%'
/*5- Muestre todos los empleados cuyo domicilio comience con "Co" y tengan un "8" (2 registros)*/
select * from empleados
  where domicilio like 'Co%8%'

/*6- Seleccione todos los empleados cuyo documento finalice en 0,2,4,6 u 8 (4 registros)*/
 select * from empleados
  where documento like '%[02468]'

/*7- Seleccione todos los empleados cuyo documento NO comience con 1 ni 3 y cuyo nombre finalice en 
"ez" (2 registros)*/
 select * from empleados
  where documento like '[^13]%' and
  nombre like '%ez'

/*8- Recupere todos los nombres que tengan una "y" o una "j" en su nombre o apellido (3 registros)*/
 select nombre from empleados
  where nombre like '%[yj]%'

/*9- Muestre los nombres y secci�n de los empleados que pertenecen a secciones que comiencen con "S" o 
"G" y tengan 8 caracteres (3 registros)*/
 select nombre,seccion from empleados
  where seccion like '[SG]_______'

/*10- Muestre los nombres y secci�n de los empleados que pertenecen a secciones que NO comiencen con 
"S" o "G" (2 registros)*/
 select nombre,seccion from empleados
  where seccion not like '[SG]%'

/*11- Muestre todos los nombres y sueldos de los empleados cuyos sueldos incluyen centavos (3 
registros)*/
 select nombre,sueldo from empleados
  where sueldo not like '%.00'

/*12- Muestre los empleados que hayan ingresado en "1990" (3 registros)*/
 select * from empleados*/
  where fechaingreso like '%1990%'
