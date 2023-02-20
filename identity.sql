create Database EjerciosSQL
use EjerciosSQL
go

/*Primer problema:*/

/*1- Elimine la tabla,si existe:*/
 if object_id('medicamentos') is not null
  drop table medicamentos;
  go

/*2- Cree la tabla con un campo "codigo" que genere valores secuenciales automáticamente:*/
 create table medicamentos(
  codigo int identity,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 )
 go

/*3- Visualice la estructura de la tabla "medicamentos":*/
 exec sp_columns medicamentos;
 go

/*4- Ingrese los siguientes registros:*/
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100)
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200)
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100)
  go

/*5- Verifique que SQL Server generó valores para el campo "código" de modo automático:*/
 select * from medicamentos;
 go

/*6- Intente ingresar un registro con un valor para el campo "codigo"*/
 insert into medicamentos (codigo)
   values(100)
   go

/*7- Intente actualizar un valor de código (aparece un mensaje de error)*/
update medicamentos set codigo =0
go

/*8- Elimine el registro con codigo "3" (1 registro eliminado)*/
delete from medicamentos where codigo = 3
go

/*9- Ingrese un nuevo registro:*/
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxilina 500','Bayer',15.60,100);
  go

/*10- Seleccione todos los registros para ver qué valor guardó SQL Server en el campo código:*/
 select * from medicamentos;
 go

 /*Segundo problema:*/

/*1- Elimine la tabla si existe:*/
 if object_id('peliculas') is not null
  drop table peliculas;

/*2- Créela definiendo un campo "codigo" autoincrementable y como clave primaria:*/
 create table peliculas(
  codigo int identity,
  titulo varchar(40),
  actor varchar(20),
  duracion int,
  primary key(codigo)
 )
 go

/*3- Ejecute el procedimiento almacenado para visualizar la estructura de la tabla:*/
 exec sp_columns peliculas;
 go

/*4- Ingrese los siguientes registros:*/
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('La vida es bella','zzz',220);
  go

/*5- Seleccione todos los registros y verifique la carga automática de los códigos:*/
 select * from peliculas;
 go

/*6- Intente actualizar el codigo de una película (aparece un mensaje de error)*/
update peliculas set codigo =0
go

/*7- Elimine la película "La vida es bella".*/
delete from peliculas where titulo='la vida es bella'
go

/*8- Ingrese un nuevo registro.*/
 insert into peliculas (titulo,actor,duracion)
  values('La vida es bella','zzz',220);
  go

/*9- Visualice los registros para ver el valor almacenado en codigo (valor 6):*/
 select * from peliculas;
 go