select propietario,count(*) as num_mascotas from mascotas where fallecimiento is null group by propietario having num_mascotas > 1;

select especie,group_concat(nombre) as nombre from mascotas group by especie having count(*) = 2;

select propietario,count(*),group_concat(distinct especie) as espe from mascotas group by propietario having espe like "%Serpiente%";

select propietario,sum(N_vacunas) as n_vacu from mascotas group by propietario having n_vacu = 0 or n_vacu is null;

select especie,sexo,sum(N_vacunas) as num_v from mascotas group by especie,sexo having num_v = 0 or num_v is Null;
