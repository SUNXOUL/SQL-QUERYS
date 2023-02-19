create Database EjerciosSQL
use EjerciosSQL

go

/*Primer problema:*/


/*1- Elimine la tabla, si existe:*/
 if object_id('peliculas') is not null
  drop table peliculas;

/*2- Cree la tabla:*/
 create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 )
 go

/*3- Vea la estructura de la tabla (sp_columns).*/
sp_columns Peliculas
go

/*4- Ingrese alos siguientes registros:*/
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',180,3)
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',190,2)
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3)
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2)
  go

/*5- Realice un "select" mostrando solamente el título y actor de todas las películas*/
select titulo, actor from peliculas
go

/*6- Muestre el título y duración de todas las peliculas*/
select titulo, duracion from peliculas
go

/*7- Muestre el título y la cantidad de copias*/
select titulo, cantidad from peliculas
go

/*Segundo problema:*/

/*1- Elimine la tabla, si existe:*/
 if object_id('empleados') is not null
  drop table empleados;
  go

/*2- Cree la tabla:*/
 create table empleados(
  nombre varchar(20),
  documento varchar(8), 
  sexo varchar(1),
  domicilio varchar(30),
  sueldobasico float
 )
 go

/*3- Vea la estructura de la tabla:*/
 exec sp_columns empleados
 go
/*4- Ingrese algunos registros:*/
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Juan Juarez','22333444','m','Sarmiento 123',500)
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Ana Acosta','27888999','f','Colon 134',700)
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Carlos Caseres','31222333','m','Urquiza 479',850)
  go

/*5- Muestre todos los datos de los empleados*/
select * from empleados
go

/*6- Muestre el nombre, documento y domicilio de los empleados*/
select nombre,documento,domicilio from empleados
go

/*7- Realice un "select" mostrando el documento, sexo y sueldo básico de todos los empleados*/
select documento,sexo,sueldobasico from empleados
go
