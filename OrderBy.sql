/*Primer problema:*/

/*1- Elimine la tabla "visitas", si existe:*/
 if object_id('visitas') is not null
  drop table visitas;

/*2- Créela con la siguiente estructura:*/
 create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fecha datetime,
  primary key(numero)
)

/*3- Ingrese algunos registros:*/
 insert into visitas (nombre,mail,pais,fecha)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

/*4- Ordene los registros por fecha, en orden descendente.*/
 select * from visitas
  order by fecha desc;

/*5- Muestre el nombre del usuario, pais y el nombre del mes, ordenado por pais (ascendente) y nombre 
del mes (descendente)*/
 select nombre,pais,datename(month,fecha)
  from visitas
  order by pais,datename(month,fecha) desc;

/*6- Muestre el pais, el mes, el día y la hora y ordene las visitas por nombre del mes, del día y la 
hora.*/
select nombre,mail,
  datename(month,fecha) mes,
  datename(day,fecha) dia,
  datename(hour,fecha) hora
  from visitas
  order by 3,4,5;

/*7- Muestre los mail, país, ordenado por país, de todos los que visitaron la página en octubre (4 
registros)*/
 select mail, pais
  from visitas
  where datename(month,fecha)='October'
  order by 2;
