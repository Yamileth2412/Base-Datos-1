-- funciones de fecha


-- Seleccionar lsos años,dias,mes y cuatrimestre

use Northwind;

select GETDATE()

select DatePART(year,OrderDate) as 'año',
DATEPART(MONTH,'2024-06-06')as 'Mes',
DATEPART (QUARTER,'2024-06-06') as 'Trimestre',
DATEPART(week, '2024-06-06')as 'Semana',
DATEPART(day,'2024-06-06')as'Dia',
DATEPART(weekday,'2024-06-06')as 'Dia de la semana '

SET LANGUAGE spanish
select DATENAME(year,orderDate) as 'año',
DATENAME(MONTH,orderDate)as 'Mes',
DATENAME(QUARTER,orderdate) as 'Trimestre',
DATENAME(week, orderdate)as 'Semana',
DATENAME(day,orderDate)as'Dia',
DATENAME(weekday,orderDate)as 'Dia de la semana '
from Orders

--funcion para obtener la diferencia entre años,meses
SELECT DATEDIFF(year,'1983-04-06',GETDATE())as 'Tiempo de vejez'

select*from Orders
--seleccionR  EL numero de dias transcurridos entre la fecha del pedido  y la fecha de entrega
SELECT DATEDIFF(day,orderdate,ShippedDate)as 'Dias transcurridos' from ORDERs

--Funcion  que devuelve alguna parte de una fecha 
--funcion que regresa el nombre de un mes o semana o dia etc
select DATENAME(MONTH,getdate())as mes
set LANGUAGE Spanish
select DATENAME(MONTH,getdate())as mes

SELECT DATENAME(MONTH,GETDATE())as mes,DATENAME(weekday,GETDATE())as dia


