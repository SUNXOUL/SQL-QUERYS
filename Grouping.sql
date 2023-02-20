/*Primer problema:*/

/*1- Elimine la tabla si existe:*/
 if object_id('empleados') is not null
  drop table empleados;

/*2- Créela con la siguiente estructura:*/
 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  sexo char(1),
  estadocivil char(1),--c=casado, s=soltero,v=viudo
  seccion varchar(20),
  primary key (documento)
 )

/*3- Ingrese algunos registros:*/
 insert into empleados
  values ('22222222','Alberto Lopez','m','c','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','f','c','Administracion');
 insert into empleados
  values ('24444444','Carlos Fuentes','m','s','Administracion');
 insert into empleados
  values ('25555555','Daniel Garcia','m','s','Sistemas');
 insert into empleados
  values ('26666666','Ester Juarez',null,'c','Sistemas');
 insert into empleados
  values ('27777777','Fabian Torres',null,'s','Sistemas');
 insert into empleados
  values ('28888888','Gabriela Lopez','f',null,'Sistemas');
 insert into empleados
  values ('29999999','Hector Garcia','m',null,'Administracion');

/*4- Cuente la cantidad de empleados agrupados por sexo y estado civil, empleando "rollup".
Es dificil distinguir los valores de detalle y resumen.*/
 select sexo,estadocivil,
  count(*) as cantidad
  from empleados
  group by sexo,estadocivil
  with rollup

/*5- Realice la misma consulta anterior pero emplee la función "grouping" para los dos campos por los 
que se agrupa para distinguir los valores de resumen y de detalle.*/

 select sexo,estadocivil,
  count(*) as cantidad,
  grouping(sexo) as 'resumen sexo',
  grouping(estadocivil) as 'resumen estado civil'
  from empleados
  group by sexo,estadocivil
  with rollup

/*6- Realice la misma consulta anterior pero con "cube" en lugar de "rollup", distinguiendo los 
valores de resumen y de detalle.*/
select sexo,estadocivil,
  count(*) as cantidad,
  grouping(sexo) as 'resumen sexo',
  grouping(estadocivil) as 'resumen estado civil'
  from empleados
  group by sexo,estadocivil
  with cube
