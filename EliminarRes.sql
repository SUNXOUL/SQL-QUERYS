/*Primer problema:*/

/*1- Elimine la tabla, si existe:*/
 if object_id('vehiculos') is not null
  drop table vehiculos

/*2- Cree la tabla:*/
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 )

/*3- Establezca una restricción "check" que admita solamente los valores "a" y "m" para el campo 
"tipo":*/
 alter table vehiculos
 add constraint CK_vehiculos_tipo
 check (tipo in ('a','m'))

/*4- Establezca una restricción "default" para el campo "tipo" que almacene el valor "a" en caso de no 
ingresarse valor para dicho campo:*/
 alter table vehiculos
  add constraint DF_vehiculos_tipo
  default 'a'
  for tipo

/*5- Establezca una restricción "check" para el campo "patente" para que acepte 3 letras seguidas de 3 
dígitos:*/
 alter table vehiculos
 add constraint CK_vehiculos_patente_patron
 check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]')

/*6- Agregue una restricción "primary key" que incluya los campos "patente" y "horallegada":*/
 alter table vehiculos
 add constraint PK_vehiculos_patentellegada
 primary key(patente,horallegada)

/*7- Ingrese un vehículo:*/
 insert into vehiculos values('SDR456','a','2005/10/10 10:10',null)

/*8- Intente ingresar un registro repitiendo la clave primaria:*/
 insert into vehiculos values('SDR456','m','2005/10/10 10:10',null)

/*9- Ingrese un registro repitiendo la patente pero no la hora de llegada:*/
 insert into vehiculos values('SDR456','m','2005/10/10 12:10',null)

/*10- Ingrese un registro repitiendo la hora de llegada pero no la patente:*/
 insert into vehiculos values('SDR111','m','2005/10/10 10:10',null)

/*11- Vea todas las restricciones para la tabla "vehiculos":*/
 exec sp_helpconstraint vehiculos;

/*12- Elimine la restricción "default" del campo "tipo".*/
 alter table vehiculos
  drop DF_vehiculos_tipo

/*13- Vea si se ha eliminado:*/
 exec sp_helpconstraint vehiculos

/*14- Elimine la restricción "primary key" y "check".*/
 alter table vehiculos
  drop PK_vehiculos_patentellegada, CK_vehiculos_tipo

/*15- Vea si se han eliminado:*/
 exec sp_helpconstraint vehiculos