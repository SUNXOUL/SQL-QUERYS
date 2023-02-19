create Database EjerciosSQL
use EjerciosSQL

go

/*Primer problema:*/
go


/*1- Elimine la tabla, si existe:*/
 if object_id('peliculas')is not null
  drop table peliculas;
go

/*2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:*/
 create table peliculas(
  nombre varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 )
 go

/*3- Vea la estructura de la tabla:*/
sp_columns peliculas
go

/*4- Ingrese los siguientes registros:*/
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',128,3)
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',130,2);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3)
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2)
go

/*5- Muestre todos los registros.*/
select * from peliculas
go

/*Segundo problema:*/


/*1- Elimine la tabla, si existe:*/
 if object_id('empleados') is not null
  drop table empleados;
go

/*2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:*/
 create table empleados(
  nombre varchar(20),
  documento varchar(8),
  sexo varchar(1),
  domicilio varchar(30),
  sueldobasico float
 )
 go

/*3- Vea la estructura de la tabla:*/
sp_columns empleados

/*4- Ingrese algunos registros:*/
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Juan Perez','22333444','m','Sarmiento 123',500)
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Ana Acosta','24555666','f','Colon 134',650)
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',800)
  go

/*5- Seleccione todos los registros.*/
select * from empleados