/*Primer problema:*/

/*1- Elimine la tabla (si existe):*/
 if object_id('empleados') is not null
  drop table empleados;

/*2- Cr�ela con la siguiente estructura e ingrese los registros siguientes:*/
 create table empleados (
  documento varchar(8),
  nombre varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2)
 )

 insert into empleados
  values ('22222222','Alberto Acosta','Sistemas',-10)
 insert into empleados
  values ('33333333','Beatriz Benitez','Recursos',3000)
 insert into empleados
  values ('34444444','Carlos Caseres','Contaduria',4000)

/*3- Intente agregar una restricci�n "check" para asegurarse que no se ingresen valores negativos para 
el sueldo:*/
 alter table empleados
 add constraint CK_empleados_sueldo_positivo
 check (sueldo>=0)

/*5- Vuelva a intentarlo agregando la opci�n "with nocheck":*/
 alter table empleados
 with nocheck
 add constraint CK_empleados_sueldo_positivo
 check (sueldo>=0)

/*6- Intente ingresar un valor negativo para sueldo:*/
 insert into empleados
  values ('35555555','Daniel Duarte','Administracion',-2000)


/*7- Deshabilite la restricci�n e ingrese el registro anterior:*/
 alter table empleados
  nocheck constraint CK_empleados_sueldo_positivo;
 insert into empleados
  values ('35555555','Daniel Duarte','Administracion',2000)

/*8- Establezca una restricci�n "check" para "seccion" que permita solamente los valores "Sistemas", 
"Administracion" y "Contadur�a":*/
 alter table empleados
 add constraint CK_empleados_seccion_lista
 check (seccion in ('Sistemas','Administracion','Contaduria'))


/*9- Establezca la restricci�n anterior evitando que se controlen los datos existentes.*/
alter table empleados
 with nocheck
 add constraint CK_empleados_seccion_lista
 check (seccion in ('Sistemas','Administracion','Contaduria'))

/*10- Vea si las restricciones de la tabla est�n o no habilitadas:*/
 exec sp_helpconstraint empleados


/*11- Habilite la restricci�n deshabilitada.*/

 alter table empleados
  check constraint CK_empleados_sueldo_positivo

/*12- Intente modificar la secci�n del empleado "Carlos Caseres" a "Recursos".*/
 update empleados set seccion='Recursos' where nombre='Carlos Caseres'

/*13- Deshabilite la restricci�n para poder realizar la actualizaci�n del punto precedente.*/

 alter table empleados
  nocheck constraint CK_empleados_seccion_lista;
 update empleados set seccion='Recursos' where nombre='Carlos Caseres'