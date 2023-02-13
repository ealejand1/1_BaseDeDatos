select group_concat(nombre),group_concat(especie) as es,year(nacimiento) as a from mascotas group by a having es like "%Perro%";

select 

select year(nacimiento) as aa,count(nombre) as nombre from mascotas group by aa having nombre >= 2 order by aa limit 1; 

select weekday(nacimiento) as dia,count(nombre) as cont from mascotas group by dia having cont = 2;

select month(nacimiento) as mes,count(nombre) as cont from mascotas group by mes having cont = 1 order by mes desc;
