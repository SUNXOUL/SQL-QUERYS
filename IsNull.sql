create Database EjerciosSQL
use EjerciosSQL
go

/*Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".*/
/*1- Elimine la tabla, si existe:*/
  if object_id('medicamentos') is not null
   drop table medicamentos;
   go

/*2- Cree la tabla con la siguiente estructura:*/
 create table medicamentos(
  codigo integer not null,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer not null
 )
 go


/*3- Visualice la estructura de la tabla "medicamentos":*/
 exec sp_columns medicamentos
 go
/*note que los campos "codigo", "nombre" y "cantidad", en la columna "IS_NULLABLE" aparece "NO" y en 
las otras "YES". */

/*4- Ingrese algunos registros con valores "null" para los campos que lo admitan:*/
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(1,'Sertal gotas',null,null,100); 
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(2,'Sertal compuesto',null,8.90,150);
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(3,'Buscapina','Roche',null,200);
  go

/*5- Vea todos los registros:*/
 select * from medicamentos;
 go

/*6- Ingrese un registro con valor "0" para el precio y cadena vacía para el laboratorio:*/
 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad)
  values(4,'Bayaspirina','',0,150);
  go

/*7- Ingrese un registro con valor "0" para el código y cantidad y cadena vacía para el nombre:*/
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(0,'','Bayer',15.60,0);
  go

/*8- Muestre todos los registros:*/
 select * from medicamentos;
 go

/*9- Intente ingresar un registro con valor nulo para un campo que no lo admite (aparece un mensaje de 
error):*/
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(null,'Amoxidal jarabe','Bayer',25,120);
  go

/*10- Recupere los registros que contengan valor "null" en el campo "laboratorio", luego los que 
tengan una cadena vacía en el mismo campo. Note que el resultado es diferente.*/
select * from medicamentos where laboratorio is null
select * from medicamentos where laboratorio = ''
go

/*11- Recupere los registros que contengan valor "null" en el campo "precio", luego los que tengan el 
valor 0 en el mismo campo. Note que el resultado es distinto.*/
select * from medicamentos where precio is null
select * from medicamentos where precio = 0
go

/*12- Recupere los registros cuyo laboratorio no contenga una cadena vacía, luego los que sean 
distintos de "null".
Note que la salida de la primera sentencia no muestra los registros con cadenas vacías y tampoco los 
que tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el 
campo laboratorio (incluso cadena vacía).*/
select * from medicamentos where laboratorio != ''
select * from medicamentos where laboratorio is not null
go

/*13- Recupere los registros cuyo precio sea distinto de 0, luego los que sean distintos de "null":
Note que la salida de la primera sentencia no muestra los registros con valor 0 y tampoco los que 
tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el 
campo precio (incluso el valor 0).*/
select * from medicamentos where precio is not null
select * from medicamentos where precio != 0
go

/*Segundo problema:*/

go
/*Trabaje con la tabla que almacena los datos sobre películas, llamada "peliculas".*/
/*1- Elimine la tabla si existe:*/
 if object_id('peliculas') is not null
  drop table peliculas;
  go

/*2- Créela con la siguiente estructura:*/
 create table peliculas(
  codigo int not null,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion int
 )
 go


/*3- Visualice la estructura de la tabla*/
 exec sp_columns peliculas;
 go

/*note que el campo "codigo" y "titulo", en la columna "IS_NULLABLE" muestra "NO" y los otros campos "YES".*/

/*4- Ingrese los siguientes registros:*/
 insert into peliculas (codigo,titulo,actor,duracion)
  values(1,'Mision imposible','Tom Cruise',120);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(2,'Harry Potter y la piedra filosofal',null,180);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(3,'Harry Potter y la camara secreta','Daniel R.',null);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(0,'Mision imposible 2','',150);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(4,'','L. Di Caprio',220);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(5,'Mujer bonita','R. Gere-J. Roberts',0);
  go

/*5- Recupere todos los registros para ver cómo SQL Server los almacenó:*/
 select * from peliculas;

/*6- Intente ingresar un registro con valor nulo para campos que no lo admiten (aparece un mensaje de 
error):*/
 insert into peliculas (codigo,titulo,actor,duracion)
  values(null,'Mujer bonita','R. Gere-J. Roberts',190);
  go

/*7- Muestre los registros con valor nulo en el campo "actor" y luego los que guardan una cadena vacía 
(note que la salida es distinta) (1 registro)*/
select * from peliculas where actor is null
select * from peliculas where actor = ''
go

/*8- Modifique los registros que tengan valor de duración desconocido (nulo) por "120" (1 registro 
actualizado)*/
 update peliculas set duracion=120
  where duracion is null
go

/*9- Coloque 'Desconocido' en el campo "actor" en los registros que tengan una cadena vacía en dicho 
campo (1 registro afectado)*/
 update peliculas set actor='Desconocido'
  where duracion =''
go

/*10- Muestre todos los registros. Note que el cambio anterior no afectó a los registros con valor 
nulo en el campo "actor".*/
select * from peliculas
go

/*11- Elimine los registros cuyo título sea una cadena vacía (1 registro)*/
delete from peliculas where titulo=''
go
