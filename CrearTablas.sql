create Database EjerciosSQL
use EjerciosSQL

go

/* Primer problema: */ 
go


/*1- Elimine la tabla "agenda" si existe:*/
 if object_id('agenda') is not null
  drop table agenda;
  go

/*2- Intente crear una tabla llamada "/agenda"*/
 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 )
 go


/* 3- cree una tabla llamada "agenda", debe tener los siguientes campos: apellido, varchar(30); nombre, 
varchar(20); domicilio, varchar (30) y telefono, varchar(11):*/

 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 )
 go

/*4- Intente crearla nuevamente. Aparece mensaje de error.*/
/* si si dio*/
go

/*5- Visualice las tablas existentes (exec sp_tables @table_owner='dbo').*/
sp_tables @table_owner='dbo'
go

/*6- Visualice la estructura de la tabla "agenda" (sp_columns).*/
sp_columns agenda
go

/*7- Elimine la tabla.*/
 if object_id('agenda') is not null
  drop table agenda;
  go

/*8- Intente eliminar la tabla, sin controlar si existe. Debe aparecer un mensaje de error.*/
drop table agenda
/* si dio*/
go



/*Segundo Problema*/

/*1- Elimine la tabla "libros", si existe:*/
 if object_id('libros') is not null
  drop table libros;
  go

/*2- Verifique que la tabla "libros" no existe en la base de datos activa (exec sp_tables @table_owner='dbo').*/
sp_tables @table_owner='dbo'
go

/*3- Cree una tabla llamada "libros". Debe definirse con los siguientes campos: titulo, varchar(20); autor, varchar(30) y editorial, varchar(15).*/
create table  libros
(
titulo varchar(20),
 autor varchar(30) ,
  editorial varchar(15)
)
go

/*4- Intente crearla nuevamente. Aparece mensaje de error.*/
create table  libros
(
titulo varchar(20),
 autor varchar(30) ,
  editorial varchar(15)
)
go

/*5- Visualice las tablas existentes.*/
sp_tables @table_owner='dbo'
go


/*6- Visualice la estructura de la tabla "libros".*/
sp_columns libros
go

/*7- Elimine la tabla.*/
  drop table libros;
  go

/*8- Intente eliminar la tabla nuevamente.*/
drop table libros;
go



