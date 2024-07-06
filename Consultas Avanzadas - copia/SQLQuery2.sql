Select * from Asistencia$;
Select * from Paciente$;
SELECT*FROM Doctores$;


SELECT Nombre,Especialidad FROM Doctores$  WHERE CodigoDoctor>400

Select Paciente$.Nombre
from HistorialMedico$
inner join Paciente$ on Paciente$.CodigoPaciente=HistorialMedico$.CodigoPac

select Paciente$.Nombre
from Citas$
INNER JOIN Paciente$ ON Paciente$.Nombre=Citas$.FechaCita


Select Doctores$.CodigoDoctor,Doctores$.Nombre,HistorialMedico$.DescripcionConsulta,Doctores$.Especialidad
from Doctores$
join HistorialMedico$ ON Doctores$.CodigoDoctor=HistorialMedico$.CodigoDoctor
WHERE HistorialMedico$.CodigoDoctor=976

select Paciente$.CodigoPaciente,Paciente$.Nombre
from Paciente$
cross join HistorialMedico$
where HistorialMedico$.CodigoPac= Paciente$.CodigoPaciente





