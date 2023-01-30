select nombre,Apellido1,Apellido2,FechaNac,Provincia from nacimientos where (length(Nombre)+length(Apellido1)+length(Apellido2))> 20;

select concat(left(Nombre,1)," ",Apellido1) as Nacido from nacimientos where locate("b",Apellido1) > 2;

select substring_index(concat(nombre," ",Apellido1," ",Apellido2),"e",2) as nacido from nacimientos where concat(nombre," ",Apellido1," ",Apellido2) like "%e%e%";
