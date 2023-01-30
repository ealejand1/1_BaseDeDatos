create table Empleado(
Cod_e varchar(10) primary key,
nombre varchar(30),
cod_d varchar(10),
fecha_incorporacion date
);

create table EsJefe(
cod_e varchar(10) primary key,
cod_jefe varchar(10),
foreign key (cod_e) references Empleado(Cod_e) on delete cascade on update cascade,
foreign key (cod_jefe) references EsJefe(cod_e) on delete cascade on update cascade
);

create table Proyecto(
cod_p varchar(10) primary key,
);

create table Emp_Proy(
cod_e varchar(10),
cod_p varchar(10),
primary key(cod_e,cod_p),
foreign key(cod_e) references Empleado(Cod_e)on delete cascade on update cascade,
foreign key(cod_p) references Proyecto(cod_p)on delete cascade on update cascade
);
create table Departamento(
cod_d varchar(10) primary key,
nombre varchar(30),
responsable varchar(10) unique,
foreign key(responsable)references Empleado(Cod_e)
);

alter table Empleado foreign key(cod_d) references Departamento(cod_d) on delete set null on update cascade;

insert into Empleado values('00001','Juan Carlos Pérez',NULL,'2005-06-15'),
('00002','Juana Benito Bermúdez',NULL,'2005-06-15'),
('00003','Ana Benito Bermúdez',NULL,'2005-09-12'),
('00004','José Losada Gato',NULL,'2005-09-22'),
('00005','Marina Villaoslada Suárez',NULL,'2008-01-29'),
('00006','Juan Garcia Garcés',NULL,'2018-10-05');

update Empleado Set cod_f='D001' where fecha_incorporacion = "2005-06-15";
update Empleado Set cod_f='D002' where cod_e = "00003" or cod_e = "00005" or cod_e = "00006";
update Empleado Set cod_f='D003' where cod_e = "00004";

insert into Departamento values('D001','Dirección','00001'),
('D002','Ventas','00003'),
('D003','Compras','00004');

insert into EsJefe values('00002','00001'),
('00003','00001'),
('00004','00002'),
('00005','00002'),
('00006','00002');

insert into Proyecto values('AL-01'),
('AL-21'),
('XP-01');

insert into Emp_Proy values('00002','AL-01'),
('00005','AL-01'),
('00006','AL-01'),
('00003','AL-21'),
('00002','XP-01'),
('00004','XP-01');


