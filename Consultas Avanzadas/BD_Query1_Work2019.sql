use AdventureWorks2019

select ProductNumber,[name],ProductLine,
case ProductLine
when 'R' then 'Road'
when 'M' then 'Mountain'
when 'T' then 'Touring'
when 'S' then 'Othen sales Items'
else 'not for sales'
end as [Category]
from Production.Product;



select productNumber  as ''Numero 
case ProductLine
when 'R' then 'Road'
when 'M' then 'Mountain'
when 'T' then 'Touring'
when 'S' then 'Othen sales Items'
else 'not for sales'
end as [Category]
from Production.Product;


