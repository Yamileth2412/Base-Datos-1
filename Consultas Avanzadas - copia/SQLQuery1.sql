CREATE DATABASE JOINS_Ejemplo

CREATE TABLE Carreras(
id_carrera INT PRIMARY KEY,
nombre_carrera VARCHAR(100)
);
CREATE TABLE Alumnos(
id_alumno INT PRIMARY KEY,
nombre VARCHAR(100),
apellido VARCHAR(100),
id_carrera INT,
FOREIGN KEY(id_carrera)REFERENCES Carreras(id_carrera)
);

INSERT INTO Carreras(id_carrera,nombre_carrera)VALUES
(101,'Ingenieria Informatica'),
(102,'Administracion de Empresas'),
(103,'Medicina'),
(104,'Tecnologias de la Informacion');


INSERT INTO Alumnos(id_alumno,nombre,apellido,id_carrera)VALUES
(201,'JUAN','PEREZ',101),
(202,'MARIA','GONZALEZ',101),
(203,'Carlos','MARTINEZ',102),
(204,'LAURA','RODRIGUEZ',103),
(205,'MARINA','GOMEZ',101),
(206,'SANDRA','SOTO',101),
(207,'MAYARA','FERNANDEZ',102),
(208,'LEONARDO','CERVANTES',103);

SELECT Alumnos.nombre,Carreras.nombre_carrera
FROM Alumnos
inner join Carreras on Alumnos.id_carrera=Carreras.id_carrera;


SELECT Alumnos.nombre,Alumnos.apellido
from Alumnos
join Carreras on Alumnos.id_carrera=Carreras.id_carrera;

