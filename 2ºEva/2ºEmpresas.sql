create table Departamentos(
Num_Dep numeric(2) primary key,
Nombre varchar(14),
Localidad varchar(10),
Direccion varchar(30),
Telefono varchar(9)
);

create table Empleados(
Num_emp numeric(4) primary key,
Apellido varchar(10),
Oficio varchar(15),
Director numeric(4),
Fecha_Alta date,
Num_dep numeric(2),
constraint FK_Empleados_Departamentos foreign key(Num_dep)references Departamentos(Num_Dep) on delete cascade,
constraint FK_Empleado_Director foreign key(director)references Empleados(Num_emp)on delete set null  
);

insert into Departamentos values('10','Contabilidad','Barcelona',NULL,NULL);
insert into Departamentos values('20','Investigación','Valencia',NULL,NULL),
('30','Ventas','Madrid',NULL,NULL),
('40','Producción','Sevilla',NULL,NULL);


insert into Empleados values('7499','Alonso','Vendedor',NULL,'1981-02-23','30'),
('7521','López','Empleado',NULL,'1981-05-06','10'),
('7654','Martin','Vendedor',NULL,'1981-05-08','30'),
('7698' ,'Garrido','Director',NULL,'1981-05-01','30'),
('7782','Martínez','Director',NULL,'1981-06-09','10'),
('7839','Rey','Presidente',NULL,'1981-11-17','10');

update Empleados Set Director= 7698 where Oficio = 'Vendedor';
update Empleados Set Director= 7782 where Oficio = 'Empleado';
update Empleados Set Director= 7839 where Oficio = 'Director';

insert into Empleados values('8744','Calvo','Vendedor','7698','1981-09-08','30'),
('7876','Gil','Analista','7782','1982-05-06','20'),
('7900','Jimenéz','Empleado','7782','1983-03-24','20');
