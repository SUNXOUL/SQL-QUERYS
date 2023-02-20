/*Primer problema:*/

/*1- Elimine la tabla "clientes", si existe:*/
 if object_id('clientes') is not null
  drop table clientes

/*2- Créela con la siguiente estructura:*/
 create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  estado varchar (20),
  pais varchar(20),
  primary key(codigo)
 )

/*3- Ingrese algunos registros:*/
 insert into clientes
  values ('Lopez Marcos','Colon 111', 'Cordoba','Cordoba','Argentina')
 insert into clientes
  values ('Perez Ana','San Martin 222', 'Carlos Paz','Cordoba','Argentina')
 insert into clientes
  values ('Garcia Juan','Rivadavia 333', 'Carlos Paz','Cordoba','Argentina')
 insert into clientes
  values ('Perez Luis','Sarmiento 444', 'Rosario','Santa Fe','Argentina')
 insert into clientes
  values ('Gomez Ines','San Martin 987', 'Santa Fe','Santa Fe','Argentina')
 insert into clientes
  values ('Gomez Ines','San Martin 666', 'Santa Fe','Santa Fe','Argentina')
 insert into clientes
  values ('Lopez Carlos','Irigoyen 888', 'Cordoba','Cordoba','Argentina')
 insert into clientes
  values ('Ramos Betina','San Martin 999', 'Cordoba','Cordoba','Argentina')
 insert into clientes
  values ('Fernando Salas','Mariano Osorio 1234', 'Santiago','Region metropolitana','Chile')
 insert into clientes
  values ('German Rojas','Allende 345', 'Valparaiso','Region V','Chile')
 insert into clientes
  values ('Ricardo Jara','Pablo Neruda 146', 'Santiago','Region metropolitana','Chile')
 insert into clientes
  values ('Joaquin Robles','Diego Rivera 147', 'Guadalajara','Jalisco','Mexico')

/*4- Necesitamos la cantidad de clientes por país y la cantidad total de clientes en una sola consulta 
(4 filas)*/
 select pais,count(*) as cantidad
  from clientes
  group by pais with rollup


/*5- Necesitamos la cantidad de clientes agrupados por pais y estado, incluyendo resultados paciales 
(9 filas)*/
 select pais,estado,
  count(*) as cantidad
  from clientes
  group by pais,estado with rollup


/*6- Necesitamos la cantidad de clientes agrupados por pais, estado y ciudad, empleando "rollup" (16 
filas)*/
 select pais,estado,ciudad,
  count(*) as cantidad
  from clientes
  group by pais,estado,ciudad
  with rollup


/*Segundo problema:*/

/*1- Elimine la tabla si existe:*/
 if object_id('notas') is not null
  drop table notas

/*2- Cree la tabla con la siguiente estructura:*/
 create table notas(
  documento char(8) not null,
  materia varchar(30),
  nota decimal(4,2)
 )

/*3-Ingrese algunos registros:*/
 insert into notas values ('22333444','Programacion',8)
 insert into notas values ('22333444','Programacion',9)
 insert into notas values ('22333444','Ingles',8)
 insert into notas values ('22333444','Ingles',7)
 insert into notas values ('22333444','Ingles',6)
 insert into notas values ('22333444','Sistemas de datos',10)
 insert into notas values ('22333444','Sistemas de datos',9)

 insert into notas values ('23444555','Programacion',5)
 insert into notas values ('23444555','Programacion',4)
 insert into notas values ('23444555','Programacion',3)
 insert into notas values ('23444555','Ingles',9)
 insert into notas values ('23444555','Ingles',7)
 insert into notas values ('23444555','Sistemas de datos',9)

 insert into notas values ('24555666','Programacion',1)
 insert into notas values ('24555666','Programacion',3.5)
 insert into notas values ('24555666','Ingles',4.5)
 insert into notas values ('24555666','Sistemas de datos',6)

/*4- Se necesita el promedio por alumno por materia y el promedio de cada alumno en todas las materias 
cursadas hasta el momento (13 registros):*/
 select documento,materia,
  avg(nota) as promedio
  from notas
  group by documento,materia with rollup;


/*5- Compruebe los resultados parciales de la consulta anterior realizando otra consulta mostrando el 
promedio de todas las carreras de cada alumno (4 filas)*/
 select documento,
  avg(nota) as promedio
  from notas
  group by documento with rollup

/*6- Muestre la cantidad de notas de cada alumno, por materia (9 filas)*/
 select documento,materia,
  count(nota) as cantidad
  from notas
  group by documento,materia

/*7- Realice la misma consulta anterior con resultados parciales incluidos (13 filas)*/
 select documento,materia,
  count(nota) as cantidad
  from notas
  group by documento,materia with rollup

/*8- Muestre la nota menor y la mayor de cada alumno y la menor y mayor nota de todos (use "rollup") 
(4 filas)*/

 select documento,
  min(nota) as minima, max(nota)as maxima
  from notas
  group by documento with rollup