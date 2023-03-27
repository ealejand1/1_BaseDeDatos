select eq.Nombre_Equipo,es.Nombre_Estadio,date_format(eq.Fecha_Fundacion,"%m") as mes from Equipo eq join Entrenador ent join Estadio es on eq.Nombre_equipo=ent.Nombre_Equipo and ent.Nombre_Equipo=es.Nombre_Equipo where es.Nombre_Estadio like "San%" and month(eq.Fecha_Fundacion) between 1 and 3;

select per.Nombre_Persona,per.Nacionalidad,li.Nombre_Liga from Personas per join Jugadores jug join Liga li on per.Nombre_Persona=jug.Nombre_Jugador and per.Nacionalidad=li.Nacionalidad where (jug.Dorsal % 2)!= 0 ;

select eq.Nombre_Equipo,es.Ciudad,count(*) from Equipo eq join Estadio es on eq.Nombre_Equipo=es.Nombre_Equipo and es.Nombre_Equipo not like es.Nombre_Ciudad group by Nombre_Jugador;
//

select date_format(emp.fecha_nacimiento," Dia %j del anio %Y") as dia,substring(emp.dni,6,3) as dni,concat(n.antiguedad," anios en la empresa" ) as antiguedad from empleado emp join nomina n on emp.cod_empleado=n.id where n.antiguedad > 15 and year(emp.fecha_nacimiento) < 1970;

select concat(cli.nombre,"-",cli.direccion) as clientedireccion,group_concat(date_format(f.fecha_inicio ,"%d de %m de %Y"))as fechain,sum(truncate(f.costes,2))as costes from cliente cli join proyecto pro join fases f on cli.cif=pro.cif and pro.codigo=f.codigo where  costes > 30000 group by clientedireccion  order by clientedireccion;

select i.metalico,i.especie,co.cod_empleado,emp.ciudad,no.neto from incentivo i join compensado co join empleado emp join nomina no on i.codigo_incentivo=co.codigo_incentivo and co.cod_empleado=emp.cod_empleado and emp.cod_empleado=no.id where no.neto < 2000 and emp.cod_postal not like "683%" and ((i.metalico > 500 and especie is null )or (i.metalico is null and especie is not null and especie like "%tarjeta%"));
