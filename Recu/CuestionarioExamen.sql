1

select matricula,fechaPermCirc,marca,modelo from automoviles where marca like "VOLVO" and matricula like "%DD_";

select matricula,fechaPermCirc,marca,modelo from automoviles where modelo like "%3%" and year(fechaPermCirc) between 2002 and 2003;

select DNI,nombre,apellido1,apellido2 from personas where apellido1 like "GARCIA" or apellido2 like "GARCIA";

2

select year(fechaNac) as anio,month(fechaNac) as mes,count(*) as nacimientos from personas where ciudad not like "M%" group by anio,mes having nacimientos > 1;

select max(fechaNac)as fecha,ciudad from personas where nombre not like "%ñ%"  group by ciudad having year(fecha) between 1980 and 1990; //error

select max(fechaNac) as fecha,ciudad from personas where length(apellido1) < 6 and month(fechaNac) between 1 and 6 group by ciudad;


