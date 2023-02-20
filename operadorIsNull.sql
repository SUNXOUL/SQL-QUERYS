/*Primer problema:*/

/*1- Elimine la tabla, si existe;*/
 if object_id('peliculas') is not null
  drop table peliculas;

/*2- Cr�ela con la siguiente estructura:*/
 create table peliculas(
  codigo int identity,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion tinyint,
  primary key (codigo)
 );

/*3- Ingrese algunos registros:*/
 insert into peliculas
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas
  values('Harry Potter y la piedra filosofal','Daniel R.',null);
 insert into peliculas
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas
  values('Mujer bonita',null,120);
 insert into peliculas
  values('Tootsie','D. Hoffman',90);
 insert into peliculas (titulo)
  values('Un oso rojo');

/*4- Recupere las pel�culas cuyo actor sea nulo (2 registros)*/
 select * from peliculas
  where actor is null;

/*5- Cambie la duraci�n a 0, de las pel�culas que tengan duraci�n igual a "null" (2 registros)*/
 update peliculas set duracion=0
  where duracion is null;

/*6- Borre todas las pel�culas donde el actor sea "null" y cuya duraci�n sea 0 (1 registro)*/
 delete from peliculas
  where actor is null and
  duracion=0;
