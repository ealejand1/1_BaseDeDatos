select sum(year(nacimiento)) from mascotas where fallecimiento is NULL;

Ejer 3

select sum(timestampdiff(YEAR,nacimiento,curdate())) as edad_total from mascotas where fallecimiento is null;

select avg(timestampdiff(YEAR,nacimiento,curdate()))) from mascotas where fallecimiento is null;

select count(nombre),group_concat(nombre) as nombre_mascotas from mascotas;

select count(distinct propietario),group_concat(distinct propietario) as nombre_propietarios from mascotas;

select max(nacimiento) from mascotas where fallecimiento is null;

Ejer 4

select max(nacimiento) as nacimiento_mas_joven, min(nacimiento) as nacimiento_mas_mayor from mascotas where fallecimiento is null;

select nombre,nacimiento from mascotas where fallecimiento is null order by nacimiento limit 1;
