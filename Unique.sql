/*Primer problema:*/
/*1- Elimine la tabla si existe:*/
 if object_id('remis') is not null
  drop table remis;

/*2- Cree la tabla con la siguiente estructura:*/
 create table remis(
  numero tinyint identity,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 )

/*3- Ingrese algunos registros, 2 de ellos con patente repetida y alguno con patente nula:*/
 insert into remis values('ABC123','Renault clio','1990');
 insert into remis values('DEF456','Peugeot 504','1995');
 insert into remis values('DEF456','Fiat Duna','1998');
 insert into remis values('GHI789','Fiat Duna','1995');
 insert into remis values(null,'Fiat Duna','1995');

/*4- Intente agregar una restricción "unique" para asegurarse que la patente del remis no tomará 
valores repetidos.*/
 alter table remis
 add constraint UQ_remis_patente
 unique(patente)

/*5- Elimine el registro con patente duplicada y establezca la restricción.*/
delete from remis where numero=3;
 alter table remis
 add constraint UQ_remis_patente
 unique(patente)

/*6- Intente ingresar un registro con patente repetida (no lo permite)*/
 insert into remis values('ABC123','Renault 11','1995')

/*7- Intente ingresar un registro con valor nulo para el campo "patente".*/
 insert into remis values(null,'Renault 11','1995')

/*8- Muestre la información de las restricciones:*/
 exec sp_helpconstraint remis;