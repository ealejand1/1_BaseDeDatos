select auto.marca,mo.gama,auto.matricula from modelos mo join automoviles auto on mo.marca=auto.marca and mo.modelo = auto.modelo and mo.marca like "VOLKSWAGEN" and mo.gama not like "Alta" and auto.matricula not in (select matricula from multas_a_vehiculos);

select auto.marca,mo.gama,auto.matricula from modelos mo join automoviles auto on concat(auto.modelo,auto.marca) = concat(mo.modelo,mo.marca) and auto.marca like "VOLKSWAGEN" and mo.gama not like "Alta" left join multas_a_vehiculos mul on auto.matricula = mul.matricula where mul.matricula is null; 

select auto.matricula,mul.matricula from automoviles auto left join multas_a_vehiculos mul on auto.matricula = mul.matricula where mul.matricula is null limit 20;
//

select per.DNI,pol.matricula,pol.cuantia,abs(pol.cuantia - (select avg(cuantia) from polizas where nombreAseguradora like "Allianz")) as diferencia from personas per join propietarios pro join automoviles auto join polizas pol on per.DNI=pro.DNI and pro.matricula=auto.matricula and auto.matricula=pol.matricula and auto.marca like "Mercedes" and pol.nombreAseguradora like "Allianz";

select per.nombre,per.apellido1,per.apellido2,count(*) as num  from personas per join propietarios pro join automoviles auto join multas_a_vehiculos mul on per.DNI = pro.DNI and pro.matricula=auto.matricula and auto.matricula = mul.matricula and mul.codSancion = 11 group by per.nombre,per.apellido1,per.apellido2 having num > 1;
