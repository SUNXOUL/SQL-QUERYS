create Database EjerciosSQL
use EjerciosSQL
go

/*Primer problema:*/

/*1- Elimine la tabla,si existe:*/
 if object_id('medicamentos') is not null
  drop table medicamentos

/*2- Cree la tabla con un campo "codigo" que genere valores secuenciales automáticamente comenzando en 
10 e incrementándose en 1:*/

 create table medicamentos(
  codigo integer identity(10,1),
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 );

/*3- Ingrese los siguientes registros:*/
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100)
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200)
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100)

/*4- Verifique que SQL Server generó valores para el campo "código" de modo automático:*/
 select *from medicamentos

/*5- Intente ingresar un registro con un valor para el campo "codigo".*/
 insert into medicamentos (codigo)
   values(100)
   go

/*6- Setee la opción "identity_insert" en "on"*/
  set identity_insert medicamentos on

/*7- Ingrese un nuevo registro sin valor para el campo "codigo" (no lo permite):*/
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxilina 500','Bayer',15.60,100)
  go

/*8- Ingrese un nuevo registro con valor para el campo "codigo" repetido.*/
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200)
  go

/*9- Use la función "ident_seed()" para averiguar el valor de inicio del campo "identity" de la tabla 
"medicamentos"*/
 select ident_seed('medicamentos')

/*10- Emplee la función "ident_incr()" para saber cuál es el valor de incremento del campo "identity" 
de "medicamentos"*/
 select ident_incr('medicamentos')

 /*Segundo problema:*/

/*1- Elimine la tabla si existe:*/
 if object_id('peliculas') is not null
  drop table peliculas

/*2- Créela definiendo un campo "codigo" autoincrementable que comience en 50 y se incremente en 3:*/
 create table peliculas(
  codigo int identity (50,3),
  titulo varchar(40),
  actor varchar(20),
  duracion int
 )

/*3- Ingrese los siguientes registros:*/
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120)
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',180)
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190)

/*4- Seleccione todos los registros y verifique la carga automática de los códigos:*/
 select *from peliculas

/*5- Setee la opción "identity_insert" en "on"*/
 set identity_insert peliculas on
 go

/*6- Ingrese un registro con valor de código menor a 50.*/
 insert into peliculas (codigo,titulo,actor,duracion)
  values(20,'Mision imposible 2','Tom Cruise',120)
  go

/*7- Ingrese un registro con valor de código mayor al último generado.*/
 insert into peliculas (codigo, titulo,actor,duracion)
 values(80,'La vida es bella','zzz',220)
go

/*8- Averigue el valor de inicio del campo "identity" de la tabla "peliculas".*/
 select ident_seed('peliculas')
 go

/*9- Averigue el valor de incremento del campo "identity" de "peliculas".*/
select ident_incr('peliculas')
go
/*10- Intente ingresar un registro sin valor para el campo código.*/
insert into peliculas (titulo,actor,duracion)
  values('Elsa y Fred','China Zorrilla',90)

/*11- Desactive la opción se inserción para el campo de identidad.*/
 set identity_insert peliculas off

/*12- Ingrese un nuevo registro y muestre todos los registros para ver cómo SQL Server siguió la 
secuencia tomando el último valor del campo como referencia.*/
 insert into peliculas (titulo,actor,duracion)
  values('Elsa y Fred','China Zorrilla',90)
 select * from peliculas
 go