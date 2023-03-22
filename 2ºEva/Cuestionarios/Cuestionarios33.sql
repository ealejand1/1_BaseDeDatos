select nombre,apellido1 from personas where DNI in (select DNI from propietarios where matricula in (select matricula from multas_a_vehiculos where codSancion in (select codigo from sanciones where categoria not like "%Exceso%" and categoria not like "%Otras%" and categoria not like "%Se%") and (year(fecha)>=2002 and year(fecha)<=2004))) and (ciudad like "H%" or ciudad like "M%") and (year(fechaNac)< 1979);


select nombre,apellido1 from personas where DNI in (select DNI from propietarios where matricula in (select matricula from automoviles where (year(fechaPermCirc) > ((select max(year(fechaPermCirc)) from automoviles) - 2)) and matricula in (select matricula from polizas where cuantia > 1000)));

