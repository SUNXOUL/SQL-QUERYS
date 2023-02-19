create Database EjerciosSQL
use EjerciosSQL
go


/*1- Elimine "agenda", si existe:*/
 if object_id('agenda') is not null
  drop table agenda;
go

/*2- Cree la tabla, con los siguientes campos: apellido (cadena de 30), nombre (cadena de 20), 
domicilio (cadena de 30) y telefono (cadena de 11).*/

 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 )
 go


/*3- Visualice la estructura de la tabla "agenda".*/
exec sp_columns agenda
go

/*4- Ingrese los siguientes registros:*/
 /*Acosta, Ana, Colon 123, 4234567;
 Bustamante, Betina, Avellaneda 135, 4458787;
 Lopez, Luis, Urquiza 333, 4545454;
 Lopez, Marisa, Urquiza 333, 4545454*/

  insert into agenda (apellido, nombre, domicilio, telefono)
  values ('Acosta','Ana','Colon 123','4234567')
 insert into agenda (apellido,nombre, domicilio, telefono)
  values ('Bustamante','Betina','Avellaneda 135','4458787')
 insert into agenda (apellido,nombre, domicilio, telefono)
  values ('Lopez','Luis','Urquiza 333','4545454')
   insert into agenda (apellido,nombre, domicilio, telefono)
  values ('Lopez','Marisa','Urquiza 333','4545454')
  go


/*- Seleccione todos los registros de la tabla*/
select * from agenda
go

/*6- Seleccione el registro cuyo nombre sea "Marisa" (1 registro)*/
select * from agenda where nombre = 'Marisa'
go

/*7- Seleccione los nombres y domicilios de quienes tengan apellido igual a "Lopez" (3 registros)*/
select nombre,domicilio from agenda where apellido ='Lopez'
go

/*8- Muestre el nombre de quienes tengan el teléfono "4545454" (2 registros)*/
select nombre from agenda where telefono ='4545454'
go


/*Segundo problema:*/


/*1- Elimine la tabla si existe.*/

/*2- Cree la tabla "libros". Debe tener la siguiente estructura:*/
 create table libros (
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15))
  go

/*3- Visualice la estructura de la tabla "libros".*/

exec sp_columns libros
go
/*4- Ingrese los siguientes registros:*/
 /*El aleph,Borges,Emece;
 Martin Fierro,Jose Hernandez,Emece;
 Martin Fierro,Jose Hernandez,Planeta;
 Aprenda PHP,Mario Molina,Siglo XXI;*/

   insert into libros (titulo, autor, editorial)
  values ('El aleph','Borges','Emece')
   insert into libros (titulo, autor, editorial)
  values ('Martin Fierro','Jose Hernandez','Emece')
     insert into libros (titulo, autor, editorial)
  values ('Martin Fierro','Jose Hernandez','Planeta')
       insert into libros (titulo, autor, editorial)
  values ('Aprenda PHP','Mario Molina','Siglo XXI')
  go

/*5- Seleccione los registros cuyo autor sea "Borges" (1 registro)*/
select * from libros where autor='Borges'
go

/*6- Seleccione los títulos de los libros cuya editorial sea "Emece" (2 registros)*/
select * from libros where editorial='Emece'

/*7- Seleccione los nombres de las editoriales de los libros cuyo titulo sea "Martin Fierro" (2 
registros)*/
select * from libros where titulo='Martin Fierro'