USE [Northwind]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[sp_YamiPrecios]
		@idproducto = 1,
		@precionuevo = 20

SELECT	'Return Value' = @return_value

GO

select *from Products