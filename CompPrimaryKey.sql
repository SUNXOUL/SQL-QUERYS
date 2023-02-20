/*Primer problema:*/

/*1- Elimine la tabla si existe:*/
 if object_id('consultas') is not null
  drop table consultas;

/*2- La tabla contiene los siguientes datos:*/
  - fechayhora: datetime not null, fecha y hora de la consulta,
  - medico: varchar(30), not null, nombre del m�dico (Perez,Lopez,Duarte),
  - documento: char(8) not null, documento del paciente,
  - paciente: varchar(30), nombre del paciente,
  - obrasocial: varchar(30), nombre de la obra social (IPAM,PAMI, etc.).
 );

/*3- Un m�dico s�lo puede atender a un paciente en una fecha y hora determianada. En una fecha y hora 
determinada, varios m�dicos atienden a distintos pacientes. Cree la tabla definiendo una clave 
primaria compuesta:*/
 create table consultas(
  fechayhora datetime not null,
  medico varchar(30) not null,
  documento char(8) not null,
  paciente varchar(30),
  obrasocial varchar(30),
  primary key(fechayhora,medico)
 )

/*4- Ingrese varias consultas para un mismo m�dico en distintas horas el mismo d�a.*/
 insert into consultas
  values ('2006/11/05 8:00','Lopez','12222222','Acosta Betina','PAMI')
 insert into consultas
  values ('2006/11/05 8:30','Lopez','23333333','Fuentes Carlos','PAMI')

/*5- Ingrese varias consultas para diferentes m�dicos en la misma fecha y hora.*/
 insert into consultas
  values ('2006/11/05 8:00','Perez','34444444','Garcia Marisa','IPAM')
 insert into consultas
  values ('2006/11/05 8:00','Duarte','45555555','Pereyra Luis','PAMI')

/*6- Intente ingresar una consulta para un mismo m�dico en la misma hora el mismo d�a.*/
 insert into consultas
  values ('2006/11/05 8:00','Perez','23333333','Fuentes Carlos','PAMI')


 /* Segundo problema:*/

/*1- Elimine la tabla "inscriptos" si existe:*/
 if object_id('inscriptos') is not null
  drop table inscriptos

/*2- La tabla contiene los siguientes campos:*/
 - documento del socio alumno: char(8) not null
 - nombre del socio: varchar(30),
 - nombre del deporte (tenis, futbol, nataci�n, basquet): varchar(15) not null,
 - a�o de inscripcion: datetime,
 - matr�cula: si la matr�cula ha sido o no pagada ('s' o 'n').

/*3- Necesitamos una clave primaria que identifique cada registro. Un socio puede inscribirse en 
varios deportes en distintos a�os. Un socio no puede inscribirse en el mismo deporte el mismo a�o. 
Varios socios se inscriben en un mismo deporte en distintos a�os. Cree la tabla con una clave 
compuesta:*/
 create table inscriptos(
  documento char(8) not null, 
  nombre varchar(30),
  deporte varchar(15) not null,
  a�o datetime,
  matricula char(1),
  primary key(documento,deporte,a�o)
 )

/*4- Inscriba a varios alumnos en el mismo deporte en el mismo a�o:*/
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2005','s')
 insert into inscriptos
  values ('23333333','Marta Garcia','tenis','2005','s')
 insert into inscriptos
  values ('34444444','Luis Perez','tenis','2005','n')

/*5- Inscriba a un mismo alumno en varios deportes en el mismo a�o:*/
 insert into inscriptos
  values ('12222222','Juan Perez','futbol','2005','s');
 insert into inscriptos
  values ('12222222','Juan Perez','natacion','2005','s');
 insert into inscriptos
  values ('12222222','Juan Perez','basquet','2005','n');

/*6- Ingrese un registro con el mismo documento de socio en el mismo deporte en distintos a�os:*/
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2006','s');
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2007','s');

/*7- Intente inscribir a un socio alumno en un deporte en el cual ya est� inscripto en un a�o en el 
cual ya se haya inscripto.*/
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2005','s'

/*8- Intente actualizar un registro para que la clave primaria se repita*/
 update inscriptos set deporte='tenis'
  where documento='12222222' and
  deporte='futbol' and
  a�o='2005'