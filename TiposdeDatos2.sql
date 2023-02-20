/*Primer problema:*/
.
/*1- Elimine la tabla "autos" si existe:*/
 if object_id('autos') is not null
  drop table autos;

/*2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo, estableciendo el campo 
"patente" como clave primaria:*/
 create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio float,
  primary key (patente)
 )


/*3- Ingrese los siguientes registros:*/
 insert into autos
  values('ACD123','Fiat 128','1970',15000);
 insert into autos
  values('ACG234','Renault 11','1990',40000);
 insert into autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into autos
  values('GCD123','Renault Clio','1990',70000);
 insert into autos
  values('BCC333','Renault Megane','1998',95000);
 insert into autos
  values('BVF543','Fiat 128','1975',20000);

/*4- Seleccione todos los autos del año 1990:*/
 select * from autos
  where modelo='1990';

  
/*Segundo problema:*/


/*1- Elimine la tabla "clientes" si existe:*/
 if object_id('clientes') is not null
  drop table clientes;

/*2- Créela eligiendo el tipo de dato más adecuado para cada campo:*/
 create table clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11)
 );


/*4- Ingrese algunos registros*/
 insert into clientes
  values('2233344','Perez','Juan','Sarmiento 980','4342345');
 insert into clientes (documento,apellido,nombre,domicilio)
  values('2333344','Perez','Ana','Colon 234');
 insert into clientes
  values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
 insert into clientes
  values('2533344','Juarez','Ana','Urquiza 444','4789900');

/*5- Seleccione todos los clientes de apellido "Perez" (2 registros):*/
 select * from clientes
  where apellido='Perez';
