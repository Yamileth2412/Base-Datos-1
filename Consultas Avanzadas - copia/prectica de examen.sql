create database repasojoins;

create table proveedor(
    provedorid int not null IDENTITY(1,1),
    nombre varchar(50)not null,
    limite_credito money not null,
    constraint pk_proveedor
    PRIMARY key(provedorid)

);
create table producto(
    prodid int not null IDENTITY(1,1),
    nombre varchar(100)not null,
    existencia int not null,
    precio money not null,
    provedor int ,
    CONSTRAINT pk_producto
    PRIMARY key(prodid),
    CONSTRAINT fk_producto_proveedor
    FOREIGN key(provedor)
    REFERENCES proveedor(provedorid)
);
--insertar datos en las tablas 
insert into proveedor(nombre,limite_credito)
values ('provedor1',10000),
('provedor2',20000),
('provedor3',30000),
('provedor4',40000),
('provedor5',50000);
insert into producto(nombre,existencia,precio,provedor)
values ('producto1',34,45,1),
('producto2',34,45,1),
('producto3',34,45,2),
('producto4',34,45,3);

SELECT*from proveedor
SELECT*from producto

select pr.nombre as 'Nombre_Porducto',pr.precio  [precio],
pr.existencia as[Existencia],p.nombre as 'Proveedor'
from proveedor as [p]
JOIN producto as [pr]
on p.provedorid=pr.provedor

--consulta lef join
--mostrar todos los proveedores  y su respectivos productos 
SELECT * from proveedor
select pr.nombre as 'Nombre_Porducto',pr.precio  [precio],
pr.existencia as[Existencia],p.provedorid,p.nombre as 'Proveedor'
from proveedor as [p]
left JOIN producto as [pr]
on p.provedorid=pr.provedor