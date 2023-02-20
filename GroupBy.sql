/*Primer problema:*/

/*1- Elimine la tabla "visitantes", si existe:*/
 if object_id('visitantes') is not null
  drop table visitantes;

/*2- Cree la tabla con la siguiente estructura:*/
 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 )

/*3- Ingrese algunos registros:*/
 insert into visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80)
 insert into visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50)
 insert into visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90)
 insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com')
 insert into visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
 insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40)
 insert into visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85)
 insert into visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50)

/*4- Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "group by" (4 filas devueltas)*/
 select ciudad, count(*)
  from visitantes
  group by ciudad;

/*5- Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad (4 filas devueltas)*/
 select ciudad, count(telefono)
  from visitantes
  group by ciudad;

/*6- Necesitamos el total del monto de las compras agrupadas por sexo (3 filas)*/
 select sexo, sum(montocompra)
  from visitantes
  group by sexo;

/*7- Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad (6 filas)*/
 select sexo,ciudad,
  max(montocompra) as mayor,
  min(montocompra) as menor
  from visitantes
  group by sexo,ciudad;

/*8- Calcule el promedio del valor de compra agrupados por ciudad (4 filas)*/
 select ciudad,
  avg(montocompra) as 'promedio de compras'
  from visitantes
  group by ciudad;

/*9- Cuente y agrupe por ciudad sin tener en cuenta los visitantes que no tienen mail (3 filas):*/
 select ciudad,
  count(*) as 'cantidad con mail'
  from visitantes
  where mail is not null and
  mail<>'no tiene'
  group by ciudad;

/*10- Realice la misma consulta anterior, pero use la palabra clave "all" para mostrar todos los 
valores de ciudad, incluyendo las que devuelven cero o "null" en la columna de agregado (4 filas)*/
 select ciudad,
  count(*) as 'cantidad con mail'
  from visitantes
  where mail is not null and
  mail<>'no tiene'
  group by all ciudad;
