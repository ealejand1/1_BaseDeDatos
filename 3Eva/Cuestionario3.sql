select auto.marca,mo.gama,auto.matricula from modelos mo join automoviles auto on mo.marca=auto.marca and mo.modelo = auto.modelo and mo.marca like "VOLKSWAGEN" and mo.gama not like "Alta" and auto.matricula not in (select matricula from multas_a_vehiculos);

select auto.marca,mo.gama,auto.matricula from modelos mo join automoviles auto on concat(auto.modelo,auto.marca) = concat(mo.modelo,mo.marca) and auto.marca like "VOLKSWAGEN" and mo.gama not like "Alta" left join multas_a_vehiculos mul on auto.matricula = mul.matricula where mul.matricula is null; 

select auto.matricula,mul.matricula from automoviles auto left join multas_a_vehiculos mul on auto.matricula = mul.matricula where mul.matricula is null limit 20;
//

select per.DNI,pol.matricula,pol.cuantia,abs(pol.cuantia - (select avg(cuantia) from polizas where nombreAseguradora like "Allianz")) as diferencia from personas per join propietarios pro join automoviles auto join polizas pol on per.DNI=pro.DNI and pro.matricula=auto.matricula and auto.matricula=pol.matricula and auto.marca like "Mercedes" and pol.nombreAseguradora like "Allianz";

select per.nombre,per.apellido1,per.apellido2,count(*) as num  from personas per join propietarios pro join automoviles auto join multas_a_vehiculos mul on per.DNI = pro.DNI and pro.matricula=auto.matricula and auto.matricula = mul.matricula and mul.codSancion = 11 group by per.nombre,per.apellido1,per.apellido2 having num > 1;
//

select per.nombre as nombre,per.DNI,pro.matricula from personas per join propietarios pro join automoviles auto join polizas pol on per.DNI=pro.DNI and pro.matricula = auto.matricula and auto.matricula=pol.matricula where pol.fechaAlta in (select min(fechaAlta) from polizas);

select per.ciudad,count(codSancion) as num from personas per join propietarios pro join automoviles auto join multas_a_vehiculos mul on per.DNI=pro.DNI and pro.matricula = auto.matricula and auto.matricula =mul.matricula and (mul.codSancion = 6 or mul.codSancion = 7 or mul.codSancion = 8 or mul.codSancion = 9 or mul.codSancion = 10 ) group by per.ciudad order by num desc limit 3;

//

select distinct per.nombre,per.apellido1,per.apellido2 from personas per join propietarios pro join automoviles auto on per.DNI=pro.DNI and pro.matricula=auto.matricula where ciudad like "Lerida" and auto.matricula in (select matricula from multas_a_vehiculos) and auto.matricula not in (select matricula from polizas);

select ase.nombre,count(po.matricula) as num from aseguradoras ase join polizas po join automoviles auto join modelos mo on ase.nombre=po.nombreAseguradora and po.matricula = auto.matricula and auto.marca=mo.marca and auto.modelo=mo.modelo where auto.marca like "Mercedes" and mo.gama like "Alta" group by ase.nombre having num > 1 order by ase.nombre;




