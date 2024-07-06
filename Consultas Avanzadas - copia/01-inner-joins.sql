-- Consultas Avanzadas
select c.CategoryName As 'Nombre Categoria', 
p.ProductName as 'Nombre Producto', 
p.UnitPrice as 'Precio', 
p.UnitsInStock as 'Existencia'
from 
Categories AS c
inner join Products As p
on c.CategoryID = p.CategoryID
where CategoryName  in ('Beverages', 'Produce')

-- Ejercicio 1: Obtener el nombre del cliente y el nombre del empleado 
-- del representante de ventas de cada pedido.

SELECT o.orderid as 'Numero de orden',
o.orderdate as 'Fecha de orden',c.CompanyName as 'Nombre del Cliente',
CONCAT(e.firstname, ' ', e.lastname) as 'Nombre del Empleado' 
FROM 
Employees as e
INNER JOIN 
Orders AS o
on  e.EmployeeID = o.EmployeeID
INNER JOIN 
customers as c
on o.CustomerID = c.CustomerID;





--Ejercicio 2: Mostrar el nombre del producto, el nombre del proveedor y el precio unitario de cada producto.
--Ejercicio 3: Listar el nombre del cliente, el ID del pedido y la fecha del pedido para cada pedido.
--Ejercicio 4: Obtener el nombre del empleado, el título del cargo y el departamento del empleado para cada empleado.
--Ejercicio 5: Mostrar el nombre del proveedor, el nombre del contacto y el teléfono del contacto para cada proveedor.
--Ejercicio 6: Listar el nombre del producto, la categoría del producto y el nombre del proveedor para cada producto.
--Ejercicio 7: Obtener el nombre del cliente, el ID del pedido, el nombre del producto y la cantidad del producto para cada detalle del pedido.
--Ejercicio 8: Obtener el nombre del empleado, el nombre del territorio y la región del territorio para cada empleado que tiene asignado un territorio.
--Ejercicio 9: Mostrar el nombre del cliente, el nombre del transportista y el nombre del país del transportista para cada pedido enviado por un transportista.
--Ejercicio 10: Obtener el nombre del producto, el nombre de la categoría y la descripción de la categoría para cada producto que pertenece a una categoría.