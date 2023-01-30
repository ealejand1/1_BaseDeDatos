select count(especie) as Num,especie from mascotas group by especie;

select count(*),especie,sexo from mascotas group by especie,sexo order by especie;

select avg(timestampdiff(year,nacimiento,curdate())) as media_edad,especie from mascotas where fallecimiento is NULL  group by especie;

select group_concat(nombre) as nombre,especie from mascotas group by especie;

/////////

select propietario, count(*),group_concat(nombre) from mascotas where fallecimiento is Null group by propietario order by count(*) asc;

select especie,sexo,group_concat(propietario) from mascotas group by especie,sexo;

select group_concat(nombre),month(nacimiento) as mes from mascotas group by mes order by mes;

select group_concat(nombre) as nombre ,weekday(nacimiento) as dia from mascotas group by dia order by count(nacimiento) desc;
