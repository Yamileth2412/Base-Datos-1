-- funciones de fecha

select   *
from  Categories as c 
LEFT join Products as p 
on c.CategoryID=p.CategoryID