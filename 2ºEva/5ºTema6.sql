select Name,Code,round((year(curdate())-IndepYear)/100) as centenarios,Indepyear from Country where round((year(curdate())-IndepYear)/100>3) order by centenarios desc;

select Nombre,Apellido1,date_format(FechaNac,"%d de %M de %Y") as nacimiento from nacimientos where Month(FechaNac)<5 and Day(FechaNac)>10;

select Nombre,Apellido1,date_add(FechaNac,interval 18 year) as mayoriaEdad from nacimientos where weekday(FechaNac)= 4;
