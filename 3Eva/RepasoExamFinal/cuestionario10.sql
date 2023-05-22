select c.nombre,d.nombre,avg(emp.salario) from empleado emp join ciudad c on emp.ciudad=c.cod_c join departamento d on emp.departamento=d.cod_d where c.nombre like "M%" group by c.nombre,d.nombre;
//

select p.nombre,p.finicio,t2.coste from proyecto p join (select t.cod_p,sum(e.salario) as coste from trabaja t join empleado e on t.cod_e=e.cod_e where t.cese is null group by t.cod_p) as t2 on p.cod_p=t2.cod_p where p.ffin is Null and abs(timestampdiff(year,p.finicio,"2020-06-15")) > 4 order by p.nombre;

/////////


//

select emp.nombre,emp.apellidos,p.nombre,(timestampdiff(day,t.incorporacion,t.cese)* 100)/timestampdiff(day,p.finicio,p.ffin) as porcentaje from proyecto p join trabaja t on p.cod_p=t.cod_p join empleado emp on emp.cod_e=t.cod_e where timestampdiff(day,p.finicio,p.ffin) is not null and timestampdiff(day,t.incorporacion,t.cese) is not null and timestampdiff(day,t.incorporacion,t.cese) > 0 and timestampdiff(day,p.finicio,p.ffin) >= timestampdiff(day,t.incorporacion,t.cese) and (timestampdiff(day,t.incorporacion,t.cese)* 100)/timestampdiff(day,p.finicio,p.ffin) between 80.0 and 100.0;


