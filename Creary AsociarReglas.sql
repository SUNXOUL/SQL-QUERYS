/*Primer problema:*/

/*1- Elimine la tabla, si existe:*/
 if object_id('vehiculos') is not null
  drop table vehiculos;

/*2- Elimine las siguientes reglas:*/
 if object_id ('RG_patente_patron') is not null
   drop rule RG_patente_patron;
 if object_id ('RG_horallegada') is not null
   drop rule RG_horallegada;
 if object_id ('RG_vehiculos_tipo') is not null
   drop rule RG_vehiculos_tipo;
 if object_id ('RG_vehiculos_tipo2') is not null
   drop rule RG_vehiculos_tipo2;
 if object_id ('RG_menor_fechaactual') is not null
   drop rule RG_menor_fechaactual;

/*3- Cree la tabla:*/
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 )

/*4- Ingrese algunos registros:*/
 insert into vehiculos values ('AAA111','a','1990-02-01 08:10',null);
 insert into vehiculos values ('BCD222','m','1990-02-01 08:10','1990-02-01 10:10');
 insert into vehiculos values ('BCD222','m','1990-02-01 12:00',null);
 insert into vehiculos values ('CC1234','a','1990-02-01 12:00',null);

/*5- Cree una regla para restringir los valores que se pueden ingresar en un campo "patente" (3 letras 
seguidas de 3 dígitos):*/
 create rule RG_patente_patron
 as @patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]'

/*6- Ejecute el procedimiento almacenado del sistema "sp_help" para ver que la regla creada 
anteriormente existe:*/
 exec sp_help;

/*7- Ejecute el procedimiento almacenado del sistema "sp_helpconstraint" para ver que la regla creada 
anteriormente no está asociada aún a ningún campo de la tabla "vehiculos".*/
exec sp_helpconstraint vehiculos;

/*8-  Asocie la regla al campo "patente":*/
 exec sp_bindrule RG_patente_patron,'vehiculos.patente';

/*9- Intente ingresar un registro con valor para el campo "patente" que no cumpla con la regla.
aparece un mensaje de error indicando que hay conflicto con la regla y la inserción no se realiza.*/
 insert into vehiculos values ('FGHIJK','a','1990-02-01 18:00',null);

/*10- Cree otra regla que controle los valores para el campo "tipo" para que solamente puedan 
ingresarse los caracteres "a" y "m".*/
 create rule RG_vehiculos_tipo
 as @tipo in ('a','m');

/*11- Asocie la regla al campo "tipo".*/
exec sp_bindrule RG_vehiculos_tipo, 'vehiculos.tipo';

/*12- Intente actualizar un registro cambiando el valor de "tipo" a un valor que no cumpla con la 
regla anterior.*/
 update vehiculos set tipo='c' where patente='AAA111';

/*13- Cree otra regla llamada "RG_vehiculos_tipo2" que controle los valores para el campo "tipo" para 
que solamente puedan ingresarse los caracteres "a", "c" y "m".*/
 create rule RG_vehiculos_tipo2
 as @tipo in ('a','c','m')

/*14- Si la asociamos a un campo que ya tiene asociada otra regla, la nueva regla reeemplaza la 
asociación anterior. Asocie la regla creada en el punto anterior al campo "tipo".*/
exec sp_bindrule RG_vehiculos_tipo2, 'vehiculos.tipo'

/*15- Actualice el registro que no pudo actualizar en el punto 12:*/
 update vehiculos set tipo='c' where patente='AAA111'

/*16- Cree una regla que permita fechas menores o iguales a la actual.*/
 create rule RG_menor_fechaactual
 as @fecha <= getdate();

/*17- Asocie la regla anterior a los campos "horallegada" y "horasalida":*/
 exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horallegada'
 exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horasalida'

/*18- Ingrese un registro en el cual la hora de entrada sea posterior a la hora de salida:*/
 insert into vehiculos values ('NOP555','a','1990-02-01 10:10','1990-02-01 08:30');

/*19- Intente establecer una restricción "check" que asegure que la fecha y hora de llegada a la playa 
no sea posterior a la fecha y hora de salida:*/
 alter table vehiculos
 add constraint CK_vehiculos_llegada_salida
 check(horallegada<=horasalida);


/*20- Elimine dicho registro:*/
 delete from vehiculos where patente='NOP555'

/*21- Establezca la restricción "check" que no pudo establecer en el punto 19:*/
 alter table vehiculos
 add constraint CK_vehiculos_llegada_salida
 check(horallegada<=horasalida);

/*22- Cree una restricción "default" que almacene el valor "b" en el campo "tipo:
 alter table vehiculos*/
 add constraint DF_vehiculos_tipo
 default 'b'
 for tipo


/*23- Intente ingresar un registro con el valor por defecto para el campo "tipo":*/
 insert into vehiculos values ('STU456',default,'1990-02-01 10:10','1990-02-01 15:30')


/*24- Vea las reglas asociadas a "empleados" y las restricciones aplicadas a la misma tabla ejecutando 
"sp_helpconstraint".*/
 exec sp_helpconstraint vehiculos;