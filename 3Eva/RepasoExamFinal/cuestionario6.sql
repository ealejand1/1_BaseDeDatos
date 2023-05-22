select a.matricula,a.marca,a.modelo,s.descripcion,s.importe from automoviles a join multas_a_vehiculos m join sanciones s on a.matricula=m.matricula and m.codSancion =s.codigo where a.marca like "TATA";
//

BOLSA 2

select p.nombre,p.apellido1,p.apellido2,sum(s.importe) as total from personas p join propietarios pro join multas_a_vehiculos m join sanciones s on m.codSancion=s.codigo and p.DNI=pro.DNI and pro.matricula=m.matricula where s.codigo in (select m.codSancion from multas_a_vehiculos m join sanciones s ON s.codigo=m.codSancion group by m.codSancion having count(*)> 100) group by p.nombre,p.apellido1,p.apellido2 having total > 700;

//

select po.nombreAseguradora,count(distinct(p.DNI))as clientes,t1.polizas from (select p.nombreAseguradora,count(*) as polizas from polizas p join propietarios pro on p.matricula=pro.matricula group by p.nombreAseguradora having count(*) > 20) as t1 join polizas po join personas p join propietarios pro on po.matricula=pro.matricula and pro.DNI=p.DNI and t1.nombreAseguradora= po.nombreAseguradora group by nombreAseguradora having count(distinct(p.DNI)) > 20 order by clientes desc,t1.polizas desc;

//

select p.nombreAseguradora,sum(s.importe)as Suma from polizas p join multas_a_vehiculos m join sanciones s on p.matricula=m.matricula and m.codSancion=s.codigo where p.nombreAseguradora in (select p.nombreAseguradora from polizas p join propietarios pro on p.matricula=pro.matricula group by p.nombreAseguradora having count(*) > 40) group by p.nombreAseguradora;
//

select p.nombre,p.apellido1,a.marca,count(*) from personas p join propietarios pro join automoviles a on p.DNI=pro.DNI and pro.matricula=a.matricula where p.DNI in(select p.DNI from personas p join propietarios pro on p.DNI=pro.DNI group by p.DNI having count(*) >= 20) group by p.nombre,p.apellido1,a.marca having count(*) >1 order by p.nombre,p.apellido1,a.marca;
