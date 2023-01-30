alter table mascotas add column N_Vacunas decimal;

update mascotas set N_vacunas=2 where year(nacimiento)=1999;

update mascotas set N_vacunas=1 where year(nacimiento) >= 2000;

insert into mascotas values ('Pepe','Benito','Serpiente','m','1998-04-12',NULL,NULL);

//

select count(nombre) from mascotas;

select count(fallecimiento) from mascotas;

select count(*) from mascotas where fallecimiento is NULL;

select count(distinct especie) from mascotas;

select sum(N_vacunas) from mascotas;
