/*Primer problema:*/

/*1- Elimine la tabla, si existe:*/
 if object_id('medicamentos') is not null
  drop table medicamentos;

/*2- Cree la tabla con la siguiente estructura:*//
 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
 );

/*3- Ingrese algunos registros:*/
 insert into medicamentos
  values('Sertal','Roche',5.2,100);
 insert into medicamentos
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos
  values('Amoxidal 500','Bayer',15.60,100);
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,200);
 insert into medicamentos
  values('Bayaspirina','Bayer',2.10,150); 
 insert into medicamentos
  values('Amoxidal jarabe','Bayer',5.10,250); 

/*4- Recupere los códigos y nombres de los medicamentos cuyo laboratorio sea 'Roche' y cuyo precio sea 
menor a 5 (1 registro cumple con ambas condiciones)*/
select codigo,nombre
  from medicamentos
  where laboratorio='Roche' and
  precio<5;

/*5- Recupere los medicamentos cuyo laboratorio sea 'Roche' o cuyo precio sea menor a 5 (4 registros):*/
 select * from medicamentos
  where laboratorio='Roche' or
  precio<5;


/*6- Muestre todos los medicamentos cuyo laboratorio NO sea "Bayer" y cuya cantidad sea=100 (1 
registro)*/
 select * from medicamentos
  where not laboratorio='Bayer' and
  cantidad=100;

/*7- Muestre todos los medicamentos cuyo laboratorio sea "Bayer" y cuya cantidad NO sea=100 (2 registros):*/
 select * from medicamentos
  where laboratorio='Bayer' and
  not cantidad=100;

/*8- Elimine todos los registros cuyo laboratorio sea igual a "Bayer" y su precio sea mayor a 10 (1 
registro eliminado)*/
 delete from medicamentos
  where laboratorio='Bayer' and
  precio>10;

/*9- Cambie la cantidad por 200, a todos los medicamentos de "Roche" cuyo precio sea mayor a 5 (1 
registro afectado)*/
update medicamentos set cantidad=200
  where laboratorio='Roche' and
  precio>5;

/*10- Borre los medicamentos cuyo laboratorio sea "Bayer" o cuyo precio sea menor a 3 (3 registros 
borrados)*/
 delete from medicamentos
  where laboratorio='Bayer' or
  precio<3;