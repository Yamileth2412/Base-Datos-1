use [bdVentas2];

select*from [Northwind].dbo.customers ;--base de datos,esquema  y tabla
select *from Cliente;
--insertar en la tabla cliente
insert into Cliente(rfc,curp,nombre,apellido1,apellido2)
values('jlsjs194Ljr49vj3','MEJIAY241209MHGJNM','Alfreds ','silofano','Servantjd'),

('jlujs194vjr49vj3','KIEFJFJE67K2RTKTHR','Ana Trujillo Emparedados y helados','camaron','valdez'),
('jlujs194ijr49lj3','KIElJFJE67K2FGKTHR','Antonio Moreno Taquería','camaron','valdez')

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

select*from empleado2


select*from Northwind.dbo.[Order Details]
order by OrderID desc