CREATE TABLE `nacimientos` (
  `Nombre` varchar(12) NOT NULL,
  `Apellido1` varchar(12) NOT NULL,
  `Apellido2` varchar(12) NOT NULL,
  `FechaNac` date DEFAULT NULL,
  `Provincia` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Nombre`,`Apellido1`,`Apellido2`)
);

insert into nacimientos(Nombre,Apellido1,Apellido2,FechaNac,Provincia) values ('Ana','Saénz','López','2008-01-05','SE');

insert into nacimientos(Nombre,Apellido1,Apellido2,FechaNac,Provincia) values('Concepción','Flores','Cruz','2009-02-27','SA');

insert into nacimientos(Nombre,Apellido1,Apellido2,FechaNac,Provincia) values('Inmaculada','Alba','Ruiz','2007-12-15','B');

insert into nacimientos(Nombre,Apellido1,Apellido2,FechaNac,Provincia) values ('Felipe','Fernández','Gómez','2007-11-13','S');

insert into nacimientos values('Sandra','Barata','Reyes','2008-05-21','M'),
('Daniel','López','Rojas','2008-07-25','TO'),
('Jaime','Ríos','Roma','2008-10-30','M'),
('Miguel','Bendita','Gil','2009-03-17','MA'),
('Raquel','Robles','Santos','2009-04-04','TO'),
('Arantxa','Antón','Barrios','2009-04-04','M'),
('Elisa','Alonso','López','2009-08-20','V'),
('Rémulo','Fernández','Alto','2009-08-19','CA');

CREATE TABLE `nacimientos09` (
  `Nombre` varchar(12) NOT NULL,
  `Apellido1` varchar(12) NOT NULL,
  `Apellido2` varchar(12) NOT NULL,
  `FechaNac` date DEFAULT NULL,
  `Provincia` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Nombre`,`Apellido1`,`Apellido2`)
);
insert into nacimientos09 select * from nacimientos where Year(FechaNac) = 2009;

CREATE TABLE `nacimientosTauro` (
  `Nombre` varchar(12) NOT NULL,
  `Apellido1` varchar(12) NOT NULL,
  `Apellido2` varchar(12) NOT NULL,
  `FechaNac` date DEFAULT NULL,
  `Provincia` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Nombre`,`Apellido1`,`Apellido2`)
);

error//insert into nacimientosTauro select * from nacimientos where (day(FechaNac)>= 21 && month(FechaNac)>= 04) && (month(FechaNac)<=05 && day(FechaNac)<= 21);

insert into nacimientosTauro select * from nacimientos where (day(FechaNac)>= 21 && month(FechaNac)= 04) || (month(FechaNac)=05 && day(FechaNac)<= 21);

2A)update nacimientos set Provincia= 'M' where Apellido1 like'%z' or Apellido2 like '%z';
2B)update nacimientos set Provincia='AL' where Provincia = 'MA';
2C)update nacimientos set FechaNac= date_add(FechaNac,interval 2 year) where Year(FechaNac)<2009;
2D)update nacimientos set Nombre=concat(Nombre,'Maria'), Apellido1= concat('de',Apellido1) where Apellido1
=substring(Apellido1,1,2) = Provincia
