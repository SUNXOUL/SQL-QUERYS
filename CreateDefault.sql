
/*Primer problema:*/

/*1- Elimine la tabla si existe:*/
 if object_id ('clientes') is not null
  drop table clientes;

2- Recuerde que si elimina una tabla, las asociaciones de reglas y valores predeterminados de sus 
campos desaparecen, pero las reglas y valores predeterminados siguen existiendo. Si intenta crear 
una regla o un valor predeterminado con igual nombre que uno existente, aparecerá un mensaje 
indicándolo, por ello, debe eliminarlos (si existen) para poder crearlos nuevamente:

 if object_id ('VP_legajo_patron') is not null
   drop default VP_legajo_patron;
 if object_id ('RG_legajo_patron') is not null
   drop rule RG_legajo_patron;
 if object_id ('RG_legajo') is not null
   drop rule RG_legajo;
 if object_id ('VP_datodesconocido') is not null
   drop default VP_datodesconocido;
 if object_id ('VP_fechaactual') is not null
   drop default VP_fechaactual;

/*3- Cree la tabla:*/
 create table clientes(
  legajo char(4),
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(15),
  provincia varchar(20) default 'Cordoba',
  fechaingreso datetime
 )

/*4- Cree una regla para establecer un patrón para los valores que se ingresen en el campo "legajo" (2 
letras seguido de 2 cifras) llamada "RG_legajo_patron":*/
 create rule RG_legajo_patron
 as @valor like '[A-Z][A-Z][0-9][0-9]'

/*5- Asocie la regla al campo "legajo".*/
 exec sp_bindrule RG_legajo_patron,'clientes.legajo'
/*6- Cree un valor predeterminado para el campo "legajo" ('AA00') llamado "VP_legajo_patron".*/
 create default VP_legajo_patron
  as 'AA00'

/*7- Asócielo al campo "legajo".*/
exec sp_bindefault VP_legajo_patron,'clientes.legajo'

/*8- Cree un valor predeterminado con la cadena "??" llamado "VP_datodesconocido".*/
create default VP_datodesconocido
  as '??'
/*9- Asócielo al campo "domicilio".*/
exec sp_bindefault VP_datodesconocido,'clientes.domicilio'

/*10- Asócielo al campo "ciudad".*/
exec sp_bindefault VP_datodesconocido,'clientes.ciudad'

/*11- Ingrese un registro con valores por defecto para los campos "domicilio" y "ciudad" y vea qué 
almacenaron.*/
 insert into clientes values('GF12','Ana Perez',default,default,'Cordoba','2001-10-10');
 select * from clientes

/*12- Intente asociar el valor predeterminado "VP_datodesconocido" al campo "provincia".*/
exec sp_bindefault VP_datodesconocido,'clientes.provincia'

/*13- Cree un valor predeterminado con la fecha actual llamado "VP_fechaactual".*/
 create default VP_fechaactual
  as getdate()

/*14- Asócielo al campo "fechaingreso".*/
exec sp_bindefault VP_fechaactual,'clientes.fechaingreso'

/*15- Ingrese algunos registros para ver cómo se almacenan los valores para los cuales no se insertan 
datos.*/
 insert into clientes default values;
 select * from clientes

/*16- Asocie el valor predeterminado "VP_datodesconocido" al campo "fechaingreso".*/
 exec sp_bindefault VP_datodesconocido,'clientes.fechaingreso'

/*17- Ingrese un registro con valores por defecto.*/
 insert into clientes default values

/*18- Cree una regla que entre en conflicto con el valor predeterminado "VP_legajo_patron".*/
 create rule RG_legajo
  as @valor like 'B%'

/*19- Asocie la regla al campo "legajo".*/
 exec sp_bindrule RG_legajo,'clientes.legajo'

/*20- Intente ingresar un registro con el valor "default" para el campo "legajo".*/
 insert into clientes values (default,'Luis Garcia','Colon 876','Cordoba','Cordoba','2001-10-10')