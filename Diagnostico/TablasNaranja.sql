--crear base de detos 
create database bdVentas;
--utilizar la base de datos
use bdVentas;
--indentity solito va incrementando solito
Create table Cliente(
clienteid int not null identity(1,1),
rfc varchar(20) not null,
curp  varchar(18)not null,
nombre varchar(50)not null,
apellido1 varchar(50)not null,
apellido2 varchar(50)not null
constraint pk_cliente
primary key(clienteid),
constraint unico_rfc
unique(rfc),
constraint unico_curp
unique(curp)
);
--LDD lenguaje de DEFINNICION   datos
--LMD LENGUAJE DE MANIPULACION DE DATOS
create table contactoProvedoor(
contactoid int not null identity(1,1),
proveedorid int not null,
nombres varchar(50)not null,
apellido1 varchar(50)not null,
apellido2 varchar(50)not null,
constraint fk_contactoProveedor
primary key(contactoid)

);
create table proveedor(
proveedorid int not null identity(1,1),
nombreEmpresa varchar(50)not null,
rfc varchar(20)not null,
calle varchar(30) not null,
colonia varchar(50)not null,
cp int not null,
paginaweb varchar(80)
constraint pk_proveedor
primary key(proveedorid),
constraint unico_nombreEmpresa
unique (nombreEmpresa),
constraint unico_rfc2
unique(rfc)
);

alter table contactoProvedoor
add constraint fk_contactoProvedoor_proveedor
foreign key (proveedorid)
references proveedor (proveedorid)


create table empleado(
empleadoid int not null identity(1,1),
nombre varchar(50)not null,
apellido1 varchar(50)not null,
apellido2 varchar(50) not null,
rfc varchar(30) not null,
curp varchar(18)not null,
numeroexterno int,
calle varchar(50)not null,
salario money not null,
numeronomina int not null,
constraint pk_empleado
primary key(empleadoid),
constraint unico_rfc_empleado
unique(rfc),
constraint unico_curp_empleado
unique(curp),
--rango and 

constraint chk_salario
check(salario>=0.0 and salario<=100000),
--check(salario between 0.1 and 100000)
constraint unico_nomina_empleado
unique(numeronomina))


create table telefonoProveedor(
telefonoid int  not null,
proveedorid int not null,
numeroTelefon varchar(15),
constraint pk_telefono_proveedor
primary key(telefonoid,proveedorid),
constraint fk_telefonoprov_proveedor
foreign key(proveedorid)
references proveedor(proveedorid)
on delete cascade
on update cascade 


)

create table producto(
numerocontrol int not null identity(1,1),
descripcion varchar(50)not null,
precio money not null,
[status] int not null,
existencia int not null,
proveedorid int not null,
constraint pk_producto
primary key(numerocontrol),
constraint unico_descripcion
unique(descripcion),
constraint chk_precio
--precio>=1 and precio<=200000
check(precio between 1 and 200000),
constraint chk_status
--status in(0,1)
check ([status]=1 or [status]=0),
constraint chk_existencia 
check(existencia>0),
constraint fr_producto_proveedor
foreign key (proveedorid)
references proveedor(proveedorid)
)

create table ordencompra(
numeroorden int not null identity(1,1),
fechacompra date not null,
fechaentrega date not null,
clienteid int not null,
empleadoid int not null,
constraint pk_ordencompra
primary key(numeroorden),
foreign key(clienteid)
references cliente(clienteid),
constraint fk_ordencompra_cliente
foreign key (empleadoid)
references empleado(empleadoid)
)
create table detalleCompra(
productoid int not null,
numeroorden int not null,
cantidad int not null,
precioCompra money not null
constraint pk_detalleCompra
--foreing key compuesta
primary key(productoid,numeroorden),
constraint fk_ordencompra_producto
foreign key(productoid)
references producto(numerocontrol),
constraint fk_ordencompra_compra
foreign key (numeroorden)
references ordencompra(numeroorden)

)
insert into Cliente(rfc ,curp,nombre,apellido1,apellido2)
values('dhdhv','jdjdfj','violett','Meza','rangel')
