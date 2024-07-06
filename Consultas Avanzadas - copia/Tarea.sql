




create or  alter procedure sp_ventas_proveedor
@year int,@month int ,@day int 
as
begin
select s.CompanyName,sum(od.UnitPrice *od.Quantity)as total from 
Suppliers as s
inner join Products as p
on s.SupplierID=p.SupplierID
inner join [Order Details] as od
on p.ProductID=od.ProductID
inner join Orders as o
on od.OrderID=o.OrderID
where datepart (year,o.OrderDate)= @year
and datepart(MONTH,o.OrderDate)=@month
and DATEPART(day,o.OrderDate)=@day
group by  s.CompanyName
order by s.CompanyName
end
go
execute sp_ventas_proveedor 1996,07,05

exec sp_ventas_proveedor @day=04,@year=1996,@month =07
--crear un sp que permita visualizar cuantas ordenes  se an echo por año y pais
--no necesitamos el grupp by
SELECT YEAR(o.OrderDate) AS 'Año',
       CONCAT(e.FirstName, ' ', e.LastName) AS 'Empleado',
       COUNT(o.OrderID) AS 'Ordenes'
FROM Employees e
INNER JOIN Orders as o ON e.EmployeeID = o.EmployeeID
GROUP BY YEAR(o.OrderDate), CONCAT(e.FirstName, ' ', e.LastName);
--sp
CREATE PROCEDURE sp_OrdenesPorAño
AS
BEGIN
    SELECT YEAR(OrderDate) AS 'Año',ShipCountry as 'Pais', COUNT(*) AS 'Cantidad Ordenes'
    FROM Orders
    GROUP BY YEAR(OrderDate), ShipCountry;
END

exec sp_OrdenesPorAño;

--crear un sp que actualize o modifique los registros nuevos en la tabla product
CREATE PROCEDURE sp_ModifiqueS
    @ProductID INT,
    @ProductName varchar,
    @supplierid int,
    @categoryid int,
    @Qantity INT,
	@unitprice money,
	@unistok varchar,
	@unitsonorder varchar,
	@reorderlevel varchar,
	@discontinued varchar
AS
BEGIN
   
    UPDATE Products
    SET
        ProductName = @ProductName,
        SupplierID = @supplierid,
        CategoryID = @categoryid,
		QuantityPerUnit=@Qantity,
		UnitPrice=@unitprice,
		UnitsInStock=@unistok,
		UnitsOnOrder=@unitsonorder,
		ReorderLevel=@reorderlevel ,
		Discontinued=@discontinued

    WHERE ProductID = @ProductID;
END
go
exec sp_ModifiqueS 12,'Chetitos',345665,3456646,5,67,'jsdhjsdh','fjfjsjf','hfuhfudfhdu','aun no';
select * from Products

--actualizar la tabla
