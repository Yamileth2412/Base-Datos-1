create database Almacen_Datos1;
use Almacen_Datos1;

create table Ventas(
clienteid int  not null,
productoid int not null,
employeid int not null,
supplierid int not null,
quantity smallint not null,
unitPrice money  not null,
constraint fk_clientes foreign key(clienteid)
references custumers(clienteid),
constraint fk_supplier1 foreign key(supplierid)
references  Supplier(supplierid),
 constraint fk_producto1 foreign key(productoid)
references product(productoid),
 constraint fk_supplier foreign key(supplierid)
references Supplier(supplierid)
);
create table Supplier(
supplierid int not null primary key IDENTITY (1,1),
Supplierbk  int not null,
CompanyName varchar(20) not null,
Country varchar(20)not null,
Addres varchar(20)not null,
city varchar(20)not null
);
create table custumers(
clienteid int not null primary key identity(1,1),
clientelbk int not null,
CompanyName varchar(50) not null,
Addresss varchar(50) not null,
City varchar(20),
Region varchar(20),
Country varchar(20)not null
);

create table Employees(
employeid int not null primary key identity(1,1),
employebk int not null,
fullName varchar(50)not null,
title varchar(50)not null,
hiredate datetime not null,
addreess varchar(60)not null,
city varchar(15)not null,
region varchar (15)not null,
country varchar(15)not null
);
create table product(
productoid int  not null primary key identity(1,1),
productby varchar(20)not null,
productName varchar(50)not null,
categoryName varchar(50)not null
);

create or alter proc sp_Actualice
@actulizar varchar  as 