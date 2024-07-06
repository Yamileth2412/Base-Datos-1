--Consultas simples(consultas a una sola tabla)
use Northwind;
--seleccionar todos los customers (clientes)
select*from Customers
--proyeccion sirve para seleccionar soolo aglunos campos de la tabla
select top 10 CustomerID,CompanyName,City,Country  from Customers
--alias columna
--country as pais
--country 'pais'
--country as'pais'
--country as 'pais de las maravillas '
select top 10 CustomerID as 'numero Cliente',CompanyName as'Nombre Empresa',City as 'ciudad',Country 'pais'
from Customers
select*from Customers
--Alias de tablas 


select Customers.CustomerID,Customers.CompanyName,
Customers.City,Customers.Country
from Customers

select c.CustomerID,c.CompanyName,
c.City,c.Country
from Customers c

--campo calculado 
select *,(p.UnitPrice*p.UnitsInStock)as 'Costo Inventario'
from Products as p

select ProductName as'Nombre Producto',
UnitsInStock as 'Existencia',
UnitPrice as'Precio Unitario',
(p.UnitPrice*p.UnitsInStock)as 'Costo Inventario'
from Products as p

--Filtrar Dtos
--clausula where y operadores relacionales
/*
< -> Menor que
> ->Mayor que
<= ->Menor o igual
>= ->Mayor o igual
<> ->Diferente
!= ->Diferente
= ->igual a
*/
select*from Customers
--selecccionar todos los clientes de alemania 
select *
from Customers
where Country='Germany'
--Seleccionar todos los productos que tengan un stock mayor a 20 mostrando solamente 
--mostrando el nombre del producto,precio,y la existencia 
select p.ProductName as 'Nombre Producto',
p.UnitPrice as'Precio Unico',
p.UnitsInStock as 'Existencia'
FROM Products as p
where p.UnitsInStock>20
order by p.ProductName desc;
select*from Products
--seleccionar todos los clientes  ordenados de foorma ascendente por pais y dentro del pais ordenados de forma ascendente  por cuidad
select * from Customers;
select c.CompanyName  as 'Nombre Compania',c.Country as 'Pais',c.City as 'Ciudad'
from Customers as c
where c.Country='Germany'
order by c.Country, CompanyName


--Eliminar valores repetitivos en una consulta
--Seleccionar los paises de los clientes 
Select Country from Customers
order by 1 asc

--count * cuenta las filas from customer"tabla"
--count (Especifica la columna)from customer
select count(distinct country)
from Customers

select distinct country from Customers
order by 1 asc

select *from Products   as p
where p.UnitPrice>=18.0
--seleccione todos los productos donde el precio es mayor o igual a 18
select *from Products   as p
where p.UnitPrice=18.0

select *from Products   as p
where p.UnitPrice!=18.0 
--prioridad de operadores 
--seleccionar todos los productos que tengan un precio entre 18 and 25

select *from Products as p
where p.UnitPrice between 18 and 25

select*from Products as p
where p.UnitPrice>38 
select *from Products

--seleccionar todos los productos donde el precio mayor a 38 y a su existencia  a 22
select*from 
Products as p
where UnitPrice>38 and UnitsInStock>=22
--seleccionar todos los productos que tengan un precio entre 18 and 25
select *from Products as p
 where p.UnitPrice not between  18 and 25

 select*from Products as p
 where not(p.UnitPrice>=18 and p.UnitPrice<=25)

 --seleccionar todos los clientes de alemanis y francia mexico
 select*from Customers as c
 where c.Country ='Germany' or c.Country= 'Mexico' or c.Country='France'

  select*from Customers as c
 where c.Country in('Germany', 'Mexico' ,'France')

 --seleccionar todos los clientes que no tengan region 
 select*from Customers as c
 where c.Region is NULL

  select*from Customers as c
  where c.Region is not null

--seleccionar todas las ordenes de julio de 1996  a abril de 1998 para los empleados  Buchan,Leverling y Davolio
select*from orders as o
where o.ShippedDate between '1996-07-01' and '1997-04-30'
and o.EmployeeID in(5,3,1)


select e.LastName as 'Empleado',
o.ShippedDate as'Fecha de Entrega'
from Employees as e
inner join Orders as o
on e.EmployeeID=o.EmployeeID
where o.ShippedDate between '1996-07-01' and '1997-04-30'
and e.LastName in('Buchanan','Leverling','Davolio')

