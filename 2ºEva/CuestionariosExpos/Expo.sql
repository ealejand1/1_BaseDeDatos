select date_format(fecha_inicio,"%d de %M") as fecha from proyecto where ((month(fecha_inicio) = 6 or month(fecha_inicio) = 7 or month(fecha_inicio) = 8 or month(fecha_inicio) = 9)  or (year(fecha_inicio) %2 = 0))and fecha_fin is null order by day(fecha_inicio);

select dni,ciudad from empleado where cod_empleado in (select id from nomina where  3000 < (neto - (neto * (10)/100))) and cod_empleado in (select cod_empleado from formado where codigo in (select codigo from proyecto where fecha_inicio in (select fecha_inicio from fases)));

select count(*) as num_salarios,group_concat(cod_empleado), as empleados from nomina where antiguedad > 10 group by antiguedad;

//

select group_concat(nombre_no_humanos)as nombres,nombre_razas from no_humanos where nombre_razas like "elfo" group by nombre_razas;

select nombre_asignaturas from asignaturas where num_horas = (2 * abs((select num_horas from asignaturas where nombre_asignaturas like "Transformaciones") - (select num_horas from asignaturas where nombre_asignaturas like "%Artes Oscuras%")));


select nombre_humanos,(select fecha_nacimiento from criaturas where id = (select id from humanos where nombre_humanos like "%Harry%")) as fecha_nacimiento,(select nombre_casa from alumnos where id = (select id from humanos where nombre_humanos like "%Harry%")) as nombre_casa from humanos where nombre_humanos like "%Harry%";
//


select DNI,Fecha_de_nacimiento,Nombre from Persona where Nombre like "c%" or  Nombre like "k%" or  Nombre like "%r" or  DNI like "%35%" or  DNI like "%22%" order by nombre,Fecha_de_nacimiento;


select concat(nombre,".",Id_usuario) as nombre,replace(Fecha_nacimiento,"1996-11-18","2000-01-01") as fechaNuevo,dayname(Fecha_nacimiento)as dia from Usuario where Nombre like "%f";


select DNI,Nombre from Persona where DNI in (select DNI from Protagoniza where ID_contenido in (select ID_contenido from Contenido where Idioma_original like "%castellano%"));
//

select concat(left(Nombre_L,3)," vs " ,left(Nombre_V,3)) as Emparejamientos ,Fecha_Partidos from Partidos where day(Fecha_Partidos) % 2 = 0 order by Fecha_Partidos desc;

select Jornada,sum(Goles_L) as Goles_L,sum(Goles_V) as Goles_V,sum(Goles_L+Goles_V) as totalGoles from Partidos group by Jornada having totalGoles > 20;

select Nombre_Estadio from Estadio_Partidos where Nombre_Estadio in();



select Nombre_Estadio from Estadio where Nombre_Equipo in (select Nombre_Equipo from Personas where Nacionalidad like "AR") order by Nombre_Estadio asc;





