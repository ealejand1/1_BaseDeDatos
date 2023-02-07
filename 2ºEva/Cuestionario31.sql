select ciudad,count(*) as num_vi from persona group by ciudad having 3 > num_vi;


select concat(left(nombre,1),".",apellidos) as persona,date_format(fnac, "%d de %M de %y" ) as fechaNac from persona where ciudad in(select count(ciudad) as num_vi from persona having 3 > num_vi);

select codigo,rango,importe from sanciones where importe >= 2 * (select importe from sanciones where rango like "Grave");

select rango,importe from sanciones where rango like "Grave"; 3 subconsultas

//


select nombre,apellidos from persona where id in(select distinct ida from alumno where idg in(select idg from alumno group by idg having count(*) = 1));

select min(fechaPermCirc),marca from automoviles group by marca having count(*) > 40;

