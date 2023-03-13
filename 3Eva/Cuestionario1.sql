select concat(a.nombre," ",a.apellidos) as persona,d.nombre from persona a join profesor b join grupo c join asignatura d on a.id = b.idp and b.idg=c.id and c.asignatura=d.id  where a.ciudad = 5;

select concat(date_format(a.finicio,"%y"),"/",date_format(a.ffinal,"%y")) as curso,count(b.id) as numero from curso a join grupo b on a.id = b.curso group by concat(date_format(a.finicio,"%y"),"/",date_format(a.ffinal,"%y"));
//

select concat(a.nombre," ",a.apellidos) as persona,concat(date_format(d.finicio,"%y"),"/",date_format(d.ffinal,"%y")) as curso from persona a join alumno b join grupo c join curso d on a.id=b.ida and b.idg=c.id and c.curso=d.id and c.asignatura = 5;

select concat(a.nombre," ",a.apellidos) as alumno,count(distinct d.id) as numero from persona a join alumno b join grupo c join curso d on a.id=b.ida and b.idg=c.id and c.curso = d.id group by alumno;
