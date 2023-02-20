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
  provincia varchar (20),
  telefono varchar(11),
  primary key(codigo)
)

/*3- Ingrese algunos registros:*/
 insert into clientes
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null')
 insert into clientes
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585')
 insert into clientes
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445')
 insert into clientes
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null)
 insert into clientes
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685')
 insert into clientes
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525')
 insert into clientes
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455')
 insert into clientes
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null)
 insert into clientes
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366')
 insert into clientes
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745')

/*4- Obtenga el total de los registros agrupados por ciudad y provincia (6 filas)*/
 select ciudad, provincia,
  count(*) as cantidad
  from clientes
  group by ciudad,provincia

/*5- Obtenga el total de los registros agrupados por ciudad y provincia sin considerar los que tienen 
menos de 2 clientes (3 filas)*/
 select ciudad, provincia,
  count(*) as cantidad
  from clientes
  group by ciudad,provincia
  having count(*)>1

/*6- Obtenga el total de los clientes que viven en calle "San Martin" (where), agrupados por provincia 
(group by), teniendo en cuenta todos los valores (all), de aquellas ciudades que tengan menos de 2 
clientes (having) y omitiendo la fila correspondiente a la ciudad de "Cordoba" (having) (4 filas 
devueltas)*/
 select ciudad, count(*)
  from clientes
  where domicilio like '%San Martin%'
  group by all ciudad
  having count(*)<2 and
  ciudad <> 'Cordoba'