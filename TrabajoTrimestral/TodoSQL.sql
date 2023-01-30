create table Tienda(
direccion varchar(40) primary key,
cod_postal numeric(5),
stock int
);

create table Secciones(
ID_Secc int auto_increment,
direccion varchar(40),
foreign key (direccion)references Tienda(direccion),
primary key(ID_Secc,direccion)
);

create table Empleados(
DNI varchar(9) primary key,
Direccion varchar(40) foreign key references Tienda(direccion),
nombre varchar(30)
);

create table SerEncargado(
DNI varchar(9) primary key,
DNI_Encargado varchar(9),
foreign key(DNI)references Empleados(DNI),
foreign key(DNI)references Empleados(DNI)
);

create table Clientes(
Dni_Cliente varchar(9) primary key,
Direccion_Cliente varchar(40),
);

create table Envios(
Cod_Envio numeric auto_increment primary key,
peso numeric(3),
dimension varchar(5),//mirar esto porque puede ser 10x20
Fecha date,
Fecha_Compra date;
Estado_Envio enum('En Proceso','En camino','En entrega','Entregado')
);

create table Libro(
ISBN numeric(13) primary key,
fecha_publicacion date,
nombre varchar(30)
);

create table Autor(
ID int auto_increment primary key,
nombre varchar(30)
);

create table Escritos(
ISBN numeric(13),
ID_Autor int auto_increment,
primary key(ISBN,ID_Autor),
foreign key(ISBN)references Libro(ISBN),
foreign key(ID_Autor)references Autor(ID)
);

create table Ejemplares(
ID_ejemplar int auto_increment,
ISBN numeric(13),
Cod_Envio numeric auto_increment, /////REVISAR ESTO POR FAVOR PLSSSSSSSSS
Estado enum('Mal','Bueno','Con algunos desperfectos'),
primary key(ID_ejemplar,ISBN),
foreign key(ISBN)references Libro(ISBN),
foreign key(Cod_Envio)references Envios(Cod_Envio)
);

