use [bdVentas2];

select*from [Northwind].dbo.customers ;--base de datos,esquema  y tabla
select *from Cliente;
--insertar en la tabla cliente
insert into Cliente(rfc,curp,nombre,apellido1,apellido2)
values('jlsjs194Ljr49vj3','MEJIAY241209MHGJNM','Alfreds ','silofano','Servantjd'),

('jlujs194vjr49vj3','KIEFJFJE67K2RTKTHR','Ana Trujillo Emparedados y helados','camaron','valdez'),
('jlujs194ijr49lj3','KIElJFJE67K2FGKTHR','Antonio Moreno Taquer�a','camaron','valdez')

delete Cliente
--Comando para reiniciar el identity de una tabla 
DBCC CHECKIDENT (Cliente,RESEED,0)
go
--crea una tabla apartir de una consulta
select top 0 employeeid as 'empleadoid', LastName as 'Apellido',
FirstName as 'PrimerNombre',
BirthDate as 'FechaNacimiento',
HireDate as 'FechaContratacion',
[address] as 'Direccion',
city as 'Ciudad',
region,PostalCode as 'CodigoPostal',
Country 'Pais'
into empleado2

from Northwind.dbo.employees 
go

select top 5 * from Northwind.dbo.[Order Details]
order by OrderID desc

go
--Altera una tabla agragando


alter table empleado2
add constraint pk_empleado2
primary key(empleadoid)
go
--Insertar datos apartir de una consulta 
insert into empleado2(empleadoid,Apellido,PrimerNombre,FechaNacimiento,FechaContratacion,Direccion,Ciudad,region,CodigoPostal,Pais)
Select employeeid as 'empleadoid', LastName as 'Apellido',
FirstName as 'PrimerNombre',
BirthDate as 'FechaNacimiento',
HireDate as 'FechaContratacion',
[address] as 'Direccion',
city as 'Ciudad',
region,PostalCode as 'CodigoPostal',
Country 'Pais'
from Northwind.dbo.Employees
--elimina la tabla de empleado
drop table empleado2;
select*from Northwind.dbo.[Order Details]
order by OrderID desc


select*from ordencompra
select *from  Cliente;
select*from empleado;
insert into empleado(nombre,apellido1,apellido2,curp,rfc,numeroexterno,calle,salario,numeronomina)
values ('Alan','Molina','Santiago','ala12349','uduupe38','23','Calle del infierno',6500,12345),
('Yamileth','Mejia','Rangel','MEJIAY241204MGJNM','DFHUFH',NULL,'Calle del Hambre ',564.00,3454),
('Moises','Santiago','Isidro','MOISJ3452MFM','DFHSAH',NULL,'Calle de la gordura ',2000.00,3894)

insert into ordencompra
values (GETDATE(),'2024-06-10',1,3),
  (getdate(),'2024-07-11',3,4)

  select * from  producto
  
  select *from Northwind.dbo.Products
  select *from proveedor
  select *from Northwind.dbo.Suppliers
  --Selecciona la fecha actual del sistema
select GETDATE()
  insert into proveedor
  select SupplierID, CompanyName ,PostalCode,'Calle del sol',city,2554,'www.prueba.com.mx' as 'paginaweb'
  from Northwind.dbo.Suppliers

  select*from producto
  select*from proveedor
  delete from proveedor

  insert into producto(numerocontrol,descripcion,precio,[status],existencia,proveedorid)
  select ProductID,ProductName,
  UnitPrice, Discontinued, UnitsInStock,SupplierID
  from Northwind.dbo.Products


  insert into detalleCompra
  values (2,2,20,(select precio from producto where numerocontrol=2))
  select * from detalleCompra

  update producto
  set precio=20.2
  where numerocontrol=1

  select *from producto
  where  numerocontrol=1

   insert into detalleCompra
   values(1,3,30,(select precio from producto where numerocontrol=1))


   --seleccionar las ordenes de compras realizadas  al producto1
   select *,(cantidad*precioCompra)as  importe from detalleCompra
   where productoid=1
   --seleccionar el total a pagar de la orden que contiene el producto1
 select sum (cantidad *precioCompra)as 'total'
 from detalleCompra
 where productoid=1


 USE Northwind
 --SELECCIONAR LOAS ORDENES ENVIADAS DE J
 SELECT*FROM Orders
 where
 ShippedDate BETWEEN'1996-07-01' and '1998-04-30'
 and EmployeeID in (5,3,1)

--seleccionar todas las compras de 1996
SELECT orderid as 'numero orden ',OrderDate as 'Fecha orden',
year(OrderDate)as año from Orders
where year( OrderDate) ='1996'
--seleccionat todas las ordenes de compra mostrando el numero de orden 
--fecha de orden,año,mes,dia de 1996 y 1998
SELECT orderid  as'numero orden',OrderDate AS 'Fecha orden' ,
year(OrderDate)as año,MONTH(OrderDate)as 'Mes',
day(OrderDate)as 'dia'
 from Orders
where year(OrderDate)='1996' or year(OrderDate)='1998'

SELECT orderid  as'numero orden',OrderDate AS 'Fecha orden' ,
year(OrderDate)as año,MONTH(OrderDate)as 'Mes',
day(OrderDate)as 'dia'
 from Orders
where year(OrderDate)in ('1996','1998')

--seleccionar todos los apellidos de los empleados que comienzaen con d
Select *from Employees
 where LastName like 'D%'
 

 --seleccionar toods los empleados que sus apelllidos comienzen con da
 Select *from Employees
 where LastName like 'Da%'
 

 --seleccionat todos los apelidos que sus apellidos terminen con a
 Select *from Employees
 where LastName like '%a'

 --seleccionar todos los empleados que su apelllido contenga la palabra a
 Select *from Employees
 where LastName like '%a%'


 --Seleccionar todos los empleados que su apellido no contenga la letra a
  Select *from Employees
 where not LastName like '%a%'

 --selecionar todos los empleados que contengan en su pellido cualquier letra o y una i
  Select *from Employees
 where LastName like '%__i%'

 --seleccionar todos los empledos donde su nombre contenga tres caracteres 
 --la palabra antes li,despues un caracterer y finalmente la letra d
  Select *from Employees
 where LastName like '%___i_g%'

 --seleccionar los apellidos que comienzen con d o con l de los empleados
   Select *from Employees
 where LastName like '[DL]%'

 --SELECCIONAR  todos los empleados que su apellidos comienzen con una h o una a
   Select *from Employees
 where LastName like '[sc]%'

 --seleccionar todos los empleados que en su apellido contengan una d o una l
  Select *from Employees
 where LastName like '[dl]%'

 --seleccionar todos los empleados en donde su apellido contenga las letras entre la a y la f
 Select *from Employees
 where LastName like '%[a-f]%'

 --seleccionar cuantos empledos en su apellido contiene las letras entre la a y la f
 Select *from Employees
SELECT count(*)as'Total empleados'from Employees
where LastName like'%[A-F]%'

--seleccionar todos los empleados en donde sus apellidos QUE NO trrminen con c o b
select * from Employees
where LastName like '[^CB]%'
--Funciones de agregado ,group by,having
/*
sum
count(*)
count(campo)
avg()
max()
min()
*/

--selecciona el numero de ordenes realizadas
select*from Orders
select count (*) as 'Total de ordenes'from orders

--selecciona el numero  de paises a los que le e dado numero de ordenes
select count(distinct ShipCountry)as 'Total de envios a paises ' from Orders
--seleccionar el total de ordenes enviadas a francia entre 1996 y 1998

select count(*)as 'Total ordenes'
from Orders
where ShipCountry='Mexico'
and year(ShippedDate) BETWEEN '1996' and '1998'
--seleccionar el precio minimo de mis productos
select * from Products
select min(UnitPrice)as 'Precio mas Bajo'FROM Products
--seleccionar el precio mas caro que tego
select max(UnitPrice)as 'Precio mas alto'from Products

--seleccionar el nombre del producto,precio,de aqueñ que sea el mas caro
select top 1 ProductName as 'Nombre',UnitPrice  from Products
order by UnitPrice desc

--seleccionar el monto total de todas las ordenes 
select sum(UnitPrice*Quantity)as 'Total de ventas' from [Order Details]
select* from [Order Details]
--Seleccionar todas las ventas realizadas alos productos que no tienen descuento
select sum(UnitPrice*Quantity)as 'Total de ventas' from [Order Details]
where Discount=0
--seleccionar hokkien fried y mozzarella di Giovanii
select*from  Products
select AVG(UnitPrice*Quantity)as 'Total ordenes'
from [Order Details]
where ProductID in (72,42)

--misma
select AVG(UnitPrice*Quantity)as 'Total ordenes'
from [Order Details]
where ProductID=72 or ProductID=42

--seleccionar el total de ventas para el cliente chop-suey Chinese de 1996 a 1998
select*from Customers

--joins
--seleccionar los datos de las tablas de categorias y de productos 
select*
from Categories as c
inner join Products as p
on c.CategoryID=p.CategoryID

select c.CategoryName as 'categoria',p.ProductName as 'Nombre ',p.UnitPrice as'precio',p.UnitsInStock as'Existencia',(p.UnitPrice*p.UnitsInStock)as 'precio inventario'
from Categories as c
inner join Products as p
on c.CategoryID=p.CategoryID

--seleccionar los productos de la categoria Beverages
select *
from Categories as c
inner join Products as p
on c.CategoryID=p.CategoryID

select c.CategoryName as 'categoria',p.ProductName as 'Nombre ',p.UnitPrice as'precio',p.UnitsInStock as'Existencia',(p.UnitPrice*p.UnitsInStock)as 'precio inventario'
from Categories as c
inner join Products as p
on c.CategoryID=p.CategoryID
where c.CategoryName='Beverages'
--seleccionar que sea a mayor a 20
and p .UnitPrice>20

select c.CategoryName as 'categoria',p.ProductName as 'Nombre ',p.UnitPrice as'precio',p.UnitsInStock as'Existencia',(p.UnitPrice*p.UnitsInStock)as 'precio inventario'
from Categories as c
inner join Products as p
on c.CategoryID=p.CategoryID
where c.CategoryName='Beverages'
--seleccionar que sea a mayor a 20
and p .UnitPrice>20
select * from Products

--seleccionar
SELECT CategoryID,COUNT(*)
from Products

select CategoryID from Products

select COUNT(*)from Products
SELECT CategoryID,COUNT(*)
from Products
GROUP by CategoryID


select c.CategoryName 'Nombre Categoria',count (*)as 'Numero de Productos'
 from 
Categories as c
inner join Products as p 
on c.CategoryID=p.CategoryID
GROUP by CategoryName
SELECT * from Categories

--consultar para mostrar todos los productos juntos con sus categorias y sus precios

select ProductName 'Nombre Producto',CategoryName as 'Categorias',UnitPrice as 'Precio Unico'
from Categories as c
inner join Products as p
on c.CategoryID=p.CategoryID


--Consultar para mostrar los nombres de los productos y los nombres de sus proovedores 
select*from Suppliers
select ProductName 'Nombre Producto',CompanyName as 'Nombre Proveedor'
from Suppliers as s
inner join Products as p
on s.SupplierID=p.SupplierID
order by s.CompanyName

--seleccionar las ordenes de compra mostrando  los nombres de los productos y sus importes 
select od.ProductID as 'Numero orden',
P.ProductName as 'Nombre del producto',
(od.UnitPrice*od.Quantity) as 'Importe'
from [Order Details] as od
inner join Products as p
on od.ProductID=p.ProductID
where (od.UnitPrice*od.Quantity)<=15000
order by 'Importe'Desc
-- mostrar las ordenes de compra y los nombres de empleados que las realizaron 
select o.OrderID as 'Numero de orden'  ,
CONCAT(e.FirstName,'',e.LastName) as 'Nombre completo'
from Orders as o
join Employees as e
on o.EmployeeID=e.EmployeeID
where year(OrderDate)in ('1996','1999')
--seleccionar las ordenes mostrando los clientes a las que se les hicieron las cantidades vendidas y los nombres de los productos
--Ejercicio 1: Obtener el nombre del cliente y el nombre del empleado del representante de ventas de cada pedido.


select o.OrderID as 'Numero orden',o.OrderDate as'Fecha orden',c.CompanyName as 'Nombre del cliente',CONCAT(e.FirstName,' ',e.LastName) as 'Nombre empleado'  
from Employees as e
inner join
Orders as o 
on e.EmployeeID=o.EmployeeID
inner join 
 Customers as c
on c.CustomerID=o.CustomerID

--Ejercicio 2: Mostrar el nombre del producto, el nombre del proveedor y el precio unitario de cada producto.
SELECT p.ProductName as 'nombre producto',s.CompanyName as 'Nombre proveedor',
p.UnitPrice as 'precio'
from Products as p
inner join Suppliers as s
on p.SupplierID=s.SupplierID

select P.ProductName,s.CompanyName,p.UnitPrice
from(
  select SupplierID,ProductName,UnitPrice from Products
)as P
join 
(
  select SupplierID,CompanyName  from Suppliers
) AS s
on p.SupplierID=s.SupplierID
--Ejercicio 3: Listar el nombre del cliente, el ID del pedido y la fecha del pedido para cada pedido.
SELECT c.CompanyName as 'nombre Cliente',o.OrderID as 'Id pedido',
o.OrderDate as 'fecha de pedido'
from Customers as c
inner join [Orders] as o
on o.CustomerID=c.CustomerID


SELECT o.OrderID as 'numero de orden ',
c.CompanyName as 'nombre Cliente',
o.OrderDate as 'fecha de pedido',
year(o.OrderDate)as 'año de compra',
MONTH(o.OrderDate)as 'mes de compra',
day(o.OrderDate)as 'dia compra'
from  (
  select  CustomerID,CompanyName from Customers
)as c
inner join 
(select CustomerID,OrderID,OrderDate  from Orders)as o                      
on c.CustomerID=o.CustomerID;
--Ejercicio 4: Obtener el nombre del empleado, el título del cargo y el territorio del empleado para cada empleado.
 select CONCAT(e.FirstName,' ',e.LastName)as 'Nombre del empleado',
 e.Title as 'cargo',t.TerritoryDescription as 'Territorio'
 from EmployeeTerritories as et
 inner join Employees as e 
on et.EmployeeID =e.EmployeeID
JOIN Territories as t 
on t.TerritoryID=et.TerritoryID



--segundo
 select CONCAT(e.FirstName,' ',e.LastName)as 'Nombre del empleado',
 e.Title as 'cargo',
 t.TerritoryDescription as 'Territorio'
 from (
     select TerritoryID, EmployeeID from  EmployeeTerritories
 ) as et
 inner join (
    select EmployeeID,LastName,Title, FirstName from Employees
 ) as e
on et.EmployeeID =e.EmployeeID
JOIN (
  select TerritoryID,TerritoryDescription  from Territories
) as t
on t.TerritoryID=et.TerritoryID
--Ejercicio 5: Mostrar el nombre del proveedor, el nombre del contacto y el teléfono del contacto para cada proveedor.
select 
from Suppliers
--seleccionar todas las ordenes mostrando el empleado que la realizo ,el cliente al que se le vendio ,el nombre de los productos sus categorias ,
--el precio que se vendio las unidades venidas y el importe  de enero de 1997 a febrero de 1998
select o.OrderID as 'Numero de orden',e.FirstName as 'Nombre empleado',c.CompanyName as 'Nombre del cliente ',p.ProductName as 'Nombre producto'
from Orders as o
join Employees as e
on o.EmployeeID=e.EmployeeID
join Customers as c
on o.CustomerID=c.CustomerID
join [Order Details] as od
on o.OrderID=od.OrderID
join Products as p
on od.ProductID=p.ProductID

select CONCAT(FirstName,' ',LastName)as 'Empleado',
c.CompanyName as 'cliente',p.ProductName as 'nombre del producto',
ca.CategoryName as 'categoria',od.UnitPrice as 'precio',
od.Quantity as 'cantidad',(od.UnitPrice * od.Quantity)as 'Importe'
from Employees as e
join Orders as o
on o.EmployeeID=e.EmployeeID
join Customers as c
on o.CustomerID=c.CustomerID
join [Order Details] as od
on o.OrderID=od.OrderID
join Products as p
on od.ProductID=p.ProductID
join Categories as  ca
on ca.CategoryID=p.CategoryID
where o.OrderDate BETWEEN '1997-01-01' and '1998-02.28'
and ca.CategoryName in ('Beverages')
order by  c.CompanyName
--cuanto dinero e vendido de la categoria beverages
SELECT sum(od.UnitPrice*od.) from 
Categories as c 
join  Products as p 
on c.CategoryID=p.CategoryID
JOIN [Order Details] AS od 
on od.ProductID= p.ProductID
join Orders as o 
on o.OrderID=od.OrderID
where o.OrderDate BETWEEN '1997-01-01' and '1998-02.28'
and ca.CategoryName in ('Beverages')

--Ejercicio 6: Listar el nombre del producto, la categoría del producto y el nombre del proveedor para cada producto.
--Ejercicio 7: Obtener el nombre del cliente, el ID del pedido, el nombre del producto y la cantidad del producto para cada detalle del pedido.
--Ejercicio 8: Obtener el nombre del empleado, el nombre del territorio y la región del territorio para cada empleado que tiene asignado un territorio.
--Ejercicio 9: Mostrar el nombre del cliente, el nombre del transportista y el nombre del país del transportista para cada pedido enviado por un transportista.
--Ejercicio 10: Obtener el nombre del producto, el nombre de la categoría y la descripción de la categoría para cada producto que pertenece a una categoría.