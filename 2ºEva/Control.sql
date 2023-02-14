select ciudad,direccion,right(direccion,2) as num from personas where (ciudad like "Pontevedra" and (right(direccion,2) >= 21 and right(direccion,2) <= 29)) or (ciudad not like "Logroño" and (right(direccion,2) >= 31 and right(direccion,2) <= 39)) order by num;
//
select matricula,fechaAlta,fechaBaja from polizas where year(fechaAlta) < 2004 and fechaBaja is not null;

//
select nombre,concat(concat(left(telefono,3),"-",substring(telefono,4,3)),"-",right(telefono,3)) as Procedencia from personas where DNI in (select DNI from propietarios where matricula in (select matricula from multas_a_vehiculos where codSancion in (select codigo from sanciones where rango like "Grave") group by matricula having count(*) > 1));
//


select count(*) as modelos,marca from modelos group by marca having modelos > 15;

