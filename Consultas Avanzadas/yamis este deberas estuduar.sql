




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


CREATE PROCEDURE sp_Modifiquesp
    @ProductID INT,
    @ProductName nchar(40),
    @supplierid int,
    @categoryid int,
    @Qantity nchar(20),
	@unitprice money,
	@unistok smallint,
	@unitsonorder smallint,
	@reorderlevel smallint,
	@discontinued bit
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
exec sp_Modifiquesp 10,'Chetitos',3,2,5  ,67,'30','29','0','0';

select*from Products


--actualizar la tabla suplier
CREATE PROCEDURE sp_ModifcarSupli1
    @suplierID INT,
    @CompanyName nchar(40),
    @contactName nchar(30),
	@contactTitle nchar(30),
    @addres nchar(60),
    @city nchar(15),
	@region nchar(15),
	@postalcode nchar(10),
	@country nchar(15),
	@phone nchar(24),
	@fax nchar(24),
	@homepage varchar(max)
AS
BEGIN
   
    UPDATE Suppliers
    SET
      
	   CompanyName=@CompanyName,
	   ContactName=@contactName,
	   ContactTitle=@contactTitle,
	   Address=@addres,
	   City=@city,
	   Region=@region,
	   PostalCode=@postalcode,
	   Country=@country,
	   Phone=@phone,
	   Fax=@fax,
	   HomePage=@homepage

    WHERE SupplierID=@suplierID ;
END
go
exec sp_ModifcarSupli1 17,'Bimbo','Patito Hule','Onibus','Callejon Guerro','Mexico','OR','42850','Maxico','7731214769','Mayumi','null' ;
select * from Suppliers

--actualizar o dificar la tabla de custumers
create or  alter procedure sp_ModifcarCustu
    @CustumersID nchar(5),
    @CompanyName nchar(40),
    @contactName nchar(30),
	@contactTitle nchar(30),
    @addres nchar(60),
    @city nchar(15),
	@region nchar(15),
	@postalcode nchar(10),
	@country nchar(15),
	@phone nchar(24),
	@fax nchar(24)
	
AS
BEGIN
   
    UPDATE Customers
    SET
      
	   CompanyName=@CompanyName,
	   ContactName=@contactName,
	   ContactTitle=@contactTitle,
	   Address=@addres,
	   City=@city,
	   Region=@region,
	   PostalCode=@postalcode,
	   Country=@country,
	   Phone=@phone,
	   Fax=@fax
	   

    WHERE CustomerID=@CustumersID ;
END
go
exec sp_ModifcarCustu ALFKI,'Yamileth','Mejia Rangel','Onibus','Callejon Guerro','Mexico','OR','42850','Mexico','7731214769','777-0967' ;
select * from Customers


--employes

create or  alter procedure sp_ModifcarEmplo2
    @EmployeID int,
    @LatsName nchar(20),
    @FirstName nchar(10),
	@Title nchar(30),
    @titleofcour nchar(25),
	@birthdate datetime,
	@hiredate datetime,
	@address nvarchar(60),
    @city nchar(15),
	@region nchar(15),
	@postalcode nchar(10),
	@country nchar(15),
	@homePhone nchar(24),
	@extension nchar(4),
	@photo image,
	@notes nvarchar(max),
	@repotst int,
	@photoPath nvarchar(255)
	
	
AS
BEGIN
   
    UPDATE Employees
    SET
      
	  
	  LastName=@LatsName,
	  FirstName=@FirstName,
	  Title=@Title,
	  TitleOfCourtesy=@titleofcour,
	  BirthDate=@birthdate,
	  HireDate=@hiredate,
	  Address=@address,
	  City=@city,
	  Region=@region,
	  PostalCode=@postalcode,
	  Country=@country,
	  HomePhone=@homePhone,
	  Extension=@extension,
	  Photo=@photo,
	  Notes=@notes,
	  ReportsTo=@repotst,
	  PhotoPath=@photoPath
	   

    WHERE EmployeeID=@EmployeID ;
END
go
exec sp_ModifcarEmplo2 5,'Mejia','Yamileth','Papasfritas','Mr.','2004-12-04','1992-05-01','Hidalgo ','Mexico','WA','42850','Mexicana','777-05','4563','null','Base de datos',6,'https.wwww.cat' ;
select * from Employees


--ventas
create or  alter procedure sp_ModifcarVentas
    @OrderID int,
	@Custumerid varchar(5),
	@Employeid int,
    @orderdate datetime,
	@RequieredDate datetime,
	@shippedDate datetime,
	@shipvia int,
	@Freight money,
	@ShipName nvarchar(40),
	@ShipAddress nvarchar(60),
	@shipCity nvarchar(15),
	@ShipRegion nvarchar(15),
	@ShipPostalCode nvarchar(10),
	@ShipCountry nvarchar(15)

	
AS
BEGIN
   
    UPDATE	Orders
    SET
      
	  
	
	CustomerID=@Custumerid,
	EmployeeID=@Employeid,
	OrderDate=@orderdate,
	RequiredDate=@RequieredDate,
	ShippedDate=@shippedDate,
	ShipVia=@shipvia,
	Freight=@Freight,
	ShipName=@ShipName,
	ShipAddress=@ShipAddress,
	ShipCity=@shipCity,
	ShipRegion=@ShipRegion,
	ShipPostalCode=@ShipPostalCode,
	ShipCountry=@ShipCountry

    WHERE OrderID=@OrderID ;
END
go
exec sp_ModifcarVentas 10248,'BOLID',7,'2004-12-04','2007-12-05','1992-05-01',897,98,'American express','Callejon Guerrero','Mexicana','sp','4563','Mexico' ;
select * from Orders
