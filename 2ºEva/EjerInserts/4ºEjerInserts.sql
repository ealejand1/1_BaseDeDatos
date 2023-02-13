create table Estudio (
id int auto_increment primary key,
nombre varchar(30) not null
);

create table Curso (
curso varchar(5) primary key
);

create table Modulo (
id int auto_increment primary key,
nombre varchar(30) not null,
horas_sem int not null default 6
);

create table Asignatura (
id int,
est int,
curso varchar(5),
primary key (id,est,curso),
foreign key (id) references Modulo (id) on delete restrict on update cascade,
foreign key (est) references Estudio (id) on update cascade,
foreign key (curso) references Curso (curso) on delete cascade
);

create table Alumno (
id decimal(5) primary key ,
nombre varchar(30) not null,
dni varchar(9) not null unique,
fechanac date default "1970-01-01"
);

create table Asiste (
alumno decimal(5),
asignatura int,
estudio int,
curso varchar(5),
primary key (alumno, asignatura, estudio, curso),
foreign key (alumno) references Alumno (id) on delete cascade on update cascade,
foreign key (asignatura, estudio, curso) references Asignatura(id,est,curso) on delete restrict
);

insert into Estudio values('1','DAM'),
('2','ASIR');

insert into Curso values('18-19'),
('19-20');

insert into Modulo values('1','BD','5'),
('2','GBD','5');

insert into Asignatura values('1','1','19-20');

insert into Alumno values ('1','Pepe','123','2000-01-01'),
('2','Ana','234','2000-02-02');

insert into Asiste values(null,1,1,"18-19");

