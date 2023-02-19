

select matricula from automoviles where locate(left(matricula,1),right(matricula,6)) > 0;

select substring(matricula,5,length(matricula)) from automoviles; //matriculas letras;

//

select nombre,apellido1,concat(year(fechaNac),"-",dayname(fechaNac)) as diaNacimiento from personas where DNI in(select DNI from propietarios where matricula in (select matricula from polizas where (fechaBaja is not null or year(fechaAlta) < 2001) and nombreAseguradora in (select nombre from aseguradoras where telefono like "%00%")));

select concat(left(nombre,1),".",apellido1," ",apellido2) as Nombre_y_apellidos from personas where ciudad like "Madrid" and DNI in (select DNI from propietarios group by DNI having count(*) > 17);

//

select nombre,apellido1,timestampdiff(YEAR,fechaNac,curdate()) - (select avg(timestampdiff(YEAR,fechaNac,curdate()))as media from personas) as Años_sobre_la_media from personas where (timestampdiff(YEAR,fechaNac,curdate()) - (select avg(timestampdiff(YEAR,fechaNac,curdate()))as media from personas)) > 0 and DNI in (select DNI from propietarios where matricula in (select matricula from automoviles where year(fechaPermCirc) = 2003 and (marca like "AUDI" or marca like "FORD")));


select year(fechaPermCirc) as año,max(month(fechaPermCirc)) as mes from automoviles where matricula in (select matricula from polizas where timestampdiff(month,fechaAlta,fechaBaja) > 25) group by año;


