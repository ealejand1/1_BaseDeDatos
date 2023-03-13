select a.matricula,a.fechaPermCirc,a.Marca,a.Modelo from automoviles a join modelos b on a.marca = b.marca and a.modelo = b.modelo and b.gama like "Alta";

select a.DNI,c.matricula,c.fechaPermCirc from personas a join propietarios b join automoviles c on a.DNI = b.DNI and b.matricula = c.matricula and a.ciudad like "Madrid";

select distinct concat(a.nombre," ",a.apellido1," ",a.apellido2) from personas a join propietarios b join automoviles c on a.DNI = b.DNI and b.matricula = c.matricula and year(c.fechaPermCirc )> year(a.fechaNac);

select a.ciudad as ciudad,count(*) as vehiculos from personas a join propietarios b on a.DNI=b.DNI group by a.ciudad order by vehiculos desc limit 3;
