--strore procedure que visualize los resultados de cada tabla
--select*from 
go
Create or alter  procedure spu_resultados
@tabla  nvarchar(50)
AS
begin
declare @query varchar(50)
set @query='select*from'+ QUOTENAME( @tabla);
exec (@query);
-- sp _executesql

end ;
go
exec spu_resultados 'products';
