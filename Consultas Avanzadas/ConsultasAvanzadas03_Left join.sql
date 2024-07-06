--Crear base de daros para demostrar el uso del left join
create DATABASE pruebajoins;
--Utilizamos las base de datos 
use pruebajoins;
--crear la tabla categoria
create table categoria(
    categoriaid int not null IDENTITY(1,1),
    nombre varchar (50) not null default 'No categoria'
    constraint pk_categoria 
    PRIMARY key (categoriaid)


)
--creat la tabla prductos
create table producto(
    productoid int not null IDENTITY(1,1),
    nombre VARCHAR(50) not null,
    existencia int not null,
    precio money not null,
    categoriaid int,
    constraint pk_producto
    PRIMARY key (productoid),
    CONSTRAINT unico_nombre
    unique(nombre),
    CONSTRAINT fk_producto_categoria
    FOREIGN key(categoriaid)
    REFERENCES categoria(categoriaid)
);
--agregar regidtros a a tabla categoria
insert into categoria(nombre)
values('LB'),
('lACTEOS'),
('ROPA'),
('BEBIDAS'),
('CARNES FRIAS');

--AGREGAR REGISTROS ALA Tabla producto
select*from categoria;
select*from producto

insert into producto(nombre,existencia,precio,categoriaid)
values ('Refrigerador',3,1000,1),
('Estufa',2,10.5,2),
('Yogurt',3,13.45,2),
('crema',3,13.45,3);

select *  from producto as p 
inner join categoria as c 
on p.categoriaid=c.categoriaid

--consulta usando left join

--seleccionar todas las categorias que no tiene asignado productos
select c.categoriaid,c.nombre
from categoria as c
LEFT join producto as p
on p.categoriaid=c.categoriaid
where p.productoid is   null

--right
select *
from producto as c
RIGHT join categoria as p
on p.categoriaid=c.categoriaid

select *
from producto as c
LEFT join categoria as p
on p.categoriaid=c.categoriaid

--full join

select *
from producto as c
FULL join categoria as p
on p.categoriaid=c.categoriaid

--ejercio 
-- -- 1.-Crear una base de datos llamada ejercicio join 
create database ejerciciojoins
use ejerciciojoins
select *from Northwind.dbo.employees;
-- -- 2.-Despues van a crear una tabla que se llame empleado otmando 
-- -- como base la tabla employees de norwind no tomar todos los campos
select top 0 EmployeeID as 'empleadoid',
CONCAT(firstname,' ',lastname)as 'NombreCompleto',
title as 'titulo',
hiredate as 'FechaContratacion'
into ejerciciojoins.dbo .empleado
from northwind.dbo.employees
-- -- 3.-llenar la tabla con una consulta a la tabla employes
insert into ejerciciojoins.dbo.empleado(NombreCompleto,titulo,FechaContratacion)
SELECT
 CONCAT(firstname,' ',lastname)as 'Nombre completo',
 title as 'titulo',
 hiredate as 'FechaContratacion'
 from northwind.dbo.employees


 select top 0 *
 into ejerciciojoins.dbo.dimepleado
 from ejerciciojoins.dbo.empleado

 select *from dimepleados
-- -- 4.-Agregar nuevos datos a la tabla empleados por lo menos 2


-- -- 5.-actualizar la tabla empleados con los nuevos registros, la cual se llevaran en una nueva tabla llamada dim_producto







insert into ejerci
