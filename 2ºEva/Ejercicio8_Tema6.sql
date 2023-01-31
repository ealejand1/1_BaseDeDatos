select group_concat(nombre),group_concat(especie) as es,year(nacimiento) as a from mascotas group by a having es like "%Perro%";
