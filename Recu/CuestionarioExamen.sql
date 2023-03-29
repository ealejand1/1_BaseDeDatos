1

select matricula,fechaPermCirc,marca,modelo from automoviles where marca like "VOLVO" and matricula like "%DD_";

select matricula,fechaPermCirc,marca,modelo from automoviles where modelo like "%3%" and year(fechaPermCirc) between 2002 and 2003;

select DNI,nombre,apellido1,apellido2 from personas where apellido1 like "GARCIA" or apellido2 like "GARCIA";

2

select year(fechaNac) as anio,month(fechaNac) as mes,count(*) as nacimientos from personas where ciudad not like "M%" group by anio,mes having nacimientos > 1;

select max(fechaNac)as fecha,ciudad from personas where nombre not like "%ñ%"  group by ciudad having year(fecha) between 1980 and 1990; //error

select max(fechaNac) as fecha,ciudad from personas where length(apellido1) < 6 and month(fechaNac) between 1 and 6 group by ciudad;

select year(fechaNac) as anio,month(fechaNac)as mes,count(*) as num  from personas where weekday(fechaNac)< 5 group by anio,mes having num > 1 and anio < 1980;

select substring(matricula,5,1) as letra,year(fechaPermCirc) as anio,count(*) as num from automoviles group by letra,anio having num > 100 order by letra;

select right(matricula,1)as letra,month(fechaPermCirc) as mes,count(*) as num from automoviles where substring(matricula,5,1) != "B" group by letra,mes having num > 5;

3

select fechaNac,nombre,apellido1,DNI from personas where (month(fechaNac) > 6 and (year(fechaNac) like "%3" or year(fechaNac) like "%4")) or (month(fechaNac) <= 6 and (year(fechaNac) like "%6" or year(fechaNac)like "%8"));

select * from automoviles where marca not like "PEUGEOT" and  marca not like "TOYOTA" and  marca not like "RENAULT" and (left(matricula,2) = substring(matricula,3,2) or left(matricula,2) = 2* substring(matricula,3,2));

3.5

select matricula,fechaPermCirc from automoviles where locate(left(monthname(fechaPermCirc),1),right(matricula,3)) > 0 and locate(date_format(fechaPermCirc,"%d"),left(matricula,4)) > 0;

4

select monthname(fechaPermCirc) as mes,count(*) as num from automoviles where locate(substring(matricula,2,1),left(matricula,1)) > 0 or locate(substring(matricula,2,1),matricula) > 2 group by mes,month(fechaPermCirc) order by month(fechaPermCirc);

select count(*) as num,marca from automoviles where left(matricula,1) <= substring(matricula,2,1) and substring(matricula,2,1) <= substring(matricula,3,1) and substring(matricula,3,1) <= substring(matricula,4,1) group by marca having num >2 order by substring(marca,2,6);

select year(fechaPermCirc) as anio,month(fechaPermCirc) as mes,max(fechaPermCirc) as tardia from automoviles where substring(matricula,5,1) < substring(matricula,6,1) and substring(matricula,6,1) < substring(matricula,7,1) group by anio,mes having day(tardia) > 25; 

select year(fechaPermCirc) as anio,truncate((month(fechaPermCirc)-1)/3,0)+1 as tri,count(*) as num from automoviles where (substring(matricula,5,1) = left(marca,1)) or (substring(matricula,5,1) = left(modelo,1)) group by anio,tri having num between 2 and 10 order by anio,tri;



