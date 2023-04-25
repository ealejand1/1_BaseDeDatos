select ciu.nombre,count(*) from persona per join ciudad ciu join rol r on per.ciudad=ciu.id and per.rol=r.id where r.nombre like "Profesor" or r.nombre like "Alumno" 

select ciu.nombre,count(*) from persona per join ciudad ciu join rol r on per.ciudad=ciu.id and per.rol=r.id where r.nombre like "Profesor"group by ciu.nombre;
