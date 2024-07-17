--MERGE INTO <target table> AS TGT
--USING <SOURCE TABLE> AS SRC  
--  ON <merge predicate>
--WHEN MATCHED [AND <predicate>] -- two clauses allowed:  
--  THEN <action> -- one with UPDATE one with DELETE
--WHEN NOT MATCHED [BY TARGET] [AND <predicate>] -- one clause allowed:  
--  THEN INSERT... –- if indicated, action must be INSERT
--WHEN NOT MATCHED BY SOURCE [AND <predicate>] -- two clauses allowed:  
--  THEN <action>; -- one with UPDATE one with DELETE

create database Escuelita;
go
use Escuelita
CREATE TABLE StudentsC1(
    StudentID       INT
    ,StudentName    VARCHAR(50)
    ,StudentStatus  BIT
);
go
INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero',1)
INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora',1)
INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(3,'Rogelio Rojas',0)
INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(4,'Mariana Rosas',1)
INSERT INTO StudentsC1(StudentID, StudentName, StudentStatus) VALUES(5,'Roman Zavaleta',1)

CREATE TABLE StudentsC2(
    StudentID       INT
    ,StudentName    VARCHAR(50)
    ,StudentStatus  BIT
);
go

INSERT INTO StudentsC2(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero Rendón',1)
INSERT INTO StudentsC2(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora Ríos',0)
INSERT INTO StudentsC2(StudentID, StudentName, StudentStatus) VALUES(6,'Mario Gonzalez Pae',1)
INSERT INTO StudentsC2(StudentID, StudentName, StudentStatus) VALUES(7,'Alberto García Morales',1)
go
select* from StudentsC1
select*from StudentsC2

delete from StudentsC2

select*from 
StudentsC1 as c1
left join StudentsC2 as c2
on c1.StudentID=c2.StudentID
where c2.StudentID is null;

select*from 
StudentsC1 as c1
inner join 
StudentsC2 as c2
on c1.StudentID=c2.StudentID

--crear un store procedure que inserte y actualice la tabla student2 mediante los datos 
--de estudents1 utlizando consultas left join y inner join
go
create or alter procedure spu_carga_Incremental_students
as
begin
begin transaction;
begin try
--se insertan estudiantes nuevos
insert into StudentsC2(StudentID,StudentName,StudentStatus)
select c1.StudentID,c1.StudentName,c1.StudentStatus  from 
   StudentsC1 as c1
   left join StudentsC2 as c2
   on c1.StudentID=c2.StudentID
   where c2.StudentID is null;

   --se actualizan los datos diferentes que ayan cambiado en student1
   UPDATE c2
   set c2.StudentName=c1.StudentName,
   c2.StudentStatus=c1.StudentStatus
   from 
   StudentsC1 as c1
   inner join 
   StudentsC2 as c2
   on c1.StudentID=c2.StudentID
   commit transaction;
end try
begin catch
rollback transaction
declare @mensajeError nvarchar(max)
set @mensajeError=ERROR_MESSAGE()
print @mensajeError
end catch;
end
go

execute spu_carga_Incremental_students
go

truncate table Studentsc1
truncate table Studentsc2

---crear un store procedure que inserte y actualice la tabla student2 mediante los datos 
--de estudents1 utlizando consultas left join marge

create or alter procedure spu_carga_Incremental_students_marge
as
begin
begin transaction;
begin try
 merge into Studentsc2 tgt
 using(
 select StudentID,StudentName,StudentStatus
  from Studentsc1
  )as src
on ( tgt.studentid=src.studentid
)
--for updates
when matched then 
update 
set tgt.studentName=src.studentName,
tgt.StudentStatus=tgt.StudentStatus

--for insert
when not matched then 
insert (Studentid,studentName,StudentStatus)
values(src.studentid,src.studentName,src.StudentStatus);


drop  procedure spu_carga_Incremental_students_marg;
go

   commit transaction;
end try
begin catch
rollback transaction
declare @mensajeError nvarchar(max)
set @mensajeError=ERROR_MESSAGE()
print @mensajeError
end catch;
end
go
exec  spu_carga_Incremental_students_marge;

insert into StudentsC1
values(6,'joseph yañez ',1)
set StudentStatus  = 0,
StudentName='Joseh ñau'
where Studentid = 6