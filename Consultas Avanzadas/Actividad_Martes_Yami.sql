/* Realizar store procedure 
Actualizar el precio de los porductos y guardar en una tabla de historicodeprecios ,la tabla debe de llevar un id 
el id del porducto que se modifico,el precio anterior ,el precio nuevo ,fecha de modificacion*/
USE NORTHWIND

create table Historicoprecios (
idProducto int primary key,
precioAnterior money,
precionuevo money,
fechaModificacion DATETIME DEFAULT GETDATE() );

select * from Historicoprecios


---Crear sp 
create or alter procedure sp_YamiPrecios1
@idproducto int,
@precionuevo money 
as 
begin 
begin transaction
begin try  
declare @precioActual money;

--consulta 
select @precioActual = UnitPrice
from Products
where 
ProductoID = @idproducto;

update Products
set UnitPrice = @precionuevo
where ProductoID = @idproducto


insert into Historicoprecios (idProducto,precioAnterior,precionuevo,fechaModificacion)
values (@idproducto,@precioActual,@precionuevo,default);

commit transaction 
end try 
begin catch  
rollback transaction  
declare @mensajeError varchar (400)
set @mensajeError = ERROR_MESSAGE ();
print @mensajeError
end catch 
end;













