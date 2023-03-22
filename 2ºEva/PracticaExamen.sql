Cuestionario 1

select nombre,Apellido1,Apellido2,FechaNac,Provincia from nacimientos where Provincia not like "MA" and (Nombre like "A%" or Apellido1 like "A%");

select Nombre,Apellido1,Apellido2 from nacimientos where FechaNac between "2006-05-01" and "2007-04-30" order by Apellido1 desc,Apellido2 desc;

Cuestionario 2

select cliente,producto,precio_unidad,unidades,(precio_unidad * unidades) as TOTAL_EUR, round((precio_unidad * unidades) * 166.386) as TOTAL_PST from facturas;

select CODIGO,SUELDO,DIETAS from empleados where COMISION is null and SUELDO < (10 * DIETAS)

select num,producto,precio_unidad,round(sqrt(num),2) as Raiz from facturas where (num % 2) = 0 order by num desc;

select num,fecha_fac,cliente,producto,unidades,precio_unidad from facturas where (cliente like "El%" and unidades > 50) or (cliente not like "El%" and unidades < 5);

select producto,ceil(unidades * precio_unidad) as PRECIO_TOTAL from facturas where unidades <= 15 order by PRECIO_TOTAL;

select TITULO,((PRECIO*100)/NUM_PAGINAS) as Precio_por_pagina from libros where((PRECIO*100)/NUM_PAGINAS) > 3;

Cuestionario 3

select nombre,edad,nomequipo,(edad-dorsal)as diferencia from ciclista where (nombre like "M%" and nomequipo like "B%") or (nombre like "A%" and nomequipo like "M%") order by diferencia desc;

select dorsal,nombre,edad from ciclista where right(dorsal,1) = right(edad,1);

Cuestionario 11

select fecha_fac,producto,unidades from facturas where unidades % 12 = 0 order by fecha_fac;

select rpad(lower(NOM_AUTOR),25,".") as Autor from libros;

Intento 2

select num,unidades,(num-unidades) as val_signo,abs(num-unidades) as val_absoluto from facturas where unidades > (2*num);

select upper(FIESTA) as fiesta from fechas where month(FECHA_CE) < 8;

Cuestionario 12

select lower(DIRECCION) as direc,(CODIGO_POSTAL)as CP,(POBLACION) as Pob,PROVINCIA as Prov,TELEFONO as Tlf,ESTADO_CIVIL as "Est.Civ" from datospersonales where POBLACION not like "MADRID";

select lower(concat(NOM_AUTOR," ",APE1_AUTOR)) as Autor,concat(upper(left(TITULO,1)),right(lower(TITULO),length(TITULO)-1)) as titulo from libros;

Intento 2

select concat(rpad(producto,15,"."),":",cliente) as procli,(unidades*precio_unidad) as coste_total,ceil((unidades*precio_unidad)/0.5) as monedas50 from facturas where length(producto) < locate("o",cliente);

Intento 3

select substring(producto,1,length(cliente)) as prodlen,(precio_unidad*unidades)as coste_total from facturas order by coste_total limit 10;

select lower(TITULO) as Titulo,concat(upper(left(NOM_AUTOR,1)),lower(right(NOM_AUTOR,length(NOM_AUTOR)-1))) as Autor from libros where NUM_PAGINAS > 200 ORDER BY Titulo desc;

Cuestionario 13

select numerorem,numerodes,date_format(finicio,"%d de %m de %Y") as finicio,date_format(ffin,"%d de %m de %Y") as fin from llamada where timestampdiff(Minute,finicio,ffin) > 10 and abs(right(numerorem,3)-right(numerodes,3)) > 3;

select terminal,cargo,date_format(finicio,"%d/%m/%y") as finicio,date_format(ffin,"%d/%m/%y") as ffin from usa where (timestampdiff(month,finicio,ffin) > 6) and abs(day(finicio)-day(ffin) < 5);

Intento 2

select numerorem,numerodes,date_format(finicio,"%kh,%im,%ss")as finicio,date_format(ffin,"%kh,%im,%ss")as ffin from llamada where date_format(finicio,"%k") between 9 and 11 and date_format(ffin,"%k") not between 9 and 11;

Intento 3

select terminal,cargo,date_format(date_add(date_add(finicio,interval 5 day),interval 1 month),"%m-%d(%Y)") as finicio from usa where timestampdiff(day,finicio,ffin) < 400;

select nombre_empleado from t_empleados order by substring(nombre_empleado,locate(" ",nombre_empleado),length(nombre_empleado));

Intento 4

select numerorem,numerodes,date_format(finicio,"%d de %m de %Y") as finicio,date_format(ffin,"%d de %m de %Y") as fin from llamada where timestampdiff(minute,finicio,ffin) > 10 and abs(right(numerorem,3)-right(numerodes,3)) > 3;

Cuestionario 15

select substring(nombre_empleado,locate(" ",nombre_empleado),length(nombre_empleado)) as nombre,fecha_nacimiento_empleado as nacimiento,fecha_ingreso_empleado as ingreso from t_empleados where timestampdiff(year,fecha_nacimiento_empleado,fecha_ingreso_empleado) <=  timestampdiff(year,fecha_ingreso_empleado,"2010-01-01");

select nombre_empleado from t_empleados  where (100* numero_hijos_empleado) < (salario_base_empleado/10) and numero_hijos_empleado > 0 order by nombre_empleado;

Cuestionario 21

select sum(exito) from peticiones;

select date_format(max(tiempo),"%H:%i") as Hora from peticiones where tiempo_procesado > 3 and tipo_peticion like "consulta";

Cuestionario 22

select codigo_cliente,sum(tiempo_procesado) from peticiones group by codigo_cliente;

select codigo_cliente,truncate(avg(megabytes_ficheros),2),truncate(avg(numero_ficheros),2) from peticiones group by codigo_cliente;

Intento 2

select hour(tiempo) as hora , count(*) as num_peticiones from peticiones group by hour(tiempo) order by hora;

select codigo_cliente,max(tiempo_procesado),max(megabytes_ficheros),min(tiempo_procesado),min(megabytes_ficheros) from peticiones where codigo_cliente like "ES%" group by codigo_cliente;

Cuestionario 24

select substring(cliente,1,(length(cliente)/2)) as cod_cli,producto,avg(precio_unidad) as media,count(*) as num from facturas where precio_unidad > 4  group by cliente,producto order by media,cod_cli;

select concat(right(cliente,2),left(cliente,2)) as cod_cli,sum(precio_unidad*unidades) as total,count(num) as num from facturas where weekday(fecha_fac) >= 3 group by cliente order by total desc limit 3;

Cuestionario 32

select fechaNac from personas where DNI IN (select DNI from propietarios where ((right(matricula,1) = substring(matricula,length(matricula)-2,1)) and substring(matricula,length(matricula)-1,1) != right(matricula,1)) and locate(left(matricula,1),right(matricula,6)) != 0);

select DNI from propietarios where ((right(matricula,1) = substring(matricula,length(matricula)-2,1)) and substring(matricula,length(matricula)-1,1) != right(matricula,1)) and locate(left(matricula,1),right(matricula,6)) != 0;



