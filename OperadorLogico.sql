create Database EjerciosSQL
use EjerciosSQL
go

/*Primer problema:*/

/*1- Elimine "articulos", si existe:*/
 if object_id('articulos') is not null
  drop table articulos;
  go

/*2- Cree la tabla, con la siguiente estructura:*/
 create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
 )
 go

/*3- Vea la estructura de la tabla (sp_columns).*/
exec sp_columns articulos
go

/*4- Ingrese algunos registros:*/
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);
  go

/*5- Seleccione los datos de las impresoras (2 registros)*/

select * from articulos where nombre = 'impresora'
go

/*6- Seleccione los artículos cuyo precio sea mayor o igual a 400 (3 registros)*/

select * from articulos where precio >= 400
go


/*7- Seleccione el código y nombre de los artículos cuya cantidad sea menor a 30 (2 registros)*/

select codigo,nombre from articulos where cantidad <30
go

/*8- Selecciones el nombre y descripción de los artículos que NO cuesten $100 (4 registros)*/

select nombre,descripcion from articulos where precio != 100
go

/*Segundo problema:*/
go

/*1- Elimine la tabla, si existe.*/
 if object_id('articulos') is not null
  drop table articulos;
  go


/*2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:*/
 create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 )
 go

/*3- Ingrese los siguientes registros:*/
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',120,3)
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',180,4)
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia R.',90,1)
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',80,2)
  go

/*4- Seleccione las películas cuya duración no supere los 90 minutos (2 registros)*/
select * from peliculas where duracion <=90
go

/*5- Seleccione el título de todas las películas en las que el actor NO sea "Tom Cruise" (2 
registros)*/
select titulo from peliculas where actor != 'Tom Cruise'
go

/*6- Muestre todos los campos, excepto "duracion", de todas las películas de las que haya más de 2 
copias (2 registros)*/
select titulo,actor,cantidad from peliculas where cantidad <=2
go