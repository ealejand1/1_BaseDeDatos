select cliente,producto,precio_unidad,unidades,(precio_unidad*unidades) As TOTAL_EUR,truncate(((precio_unidad*unidades)*166.386),0) as TOTAL_PST  from facturas;

select CODIGO,SUELDO,DIETAS from empleados where SUELDO < 10*DIETAS and COMISION is NULL;

//
1Cuestinario 2º INTENTO

select producto,ceil(unidades*precio_unidad) as PRECIO_TOTAL from facturas where unidades <= 15 order by PRECIO_TOTAL asc;

select TITULO,(PRECIO/NUM_PAGINAS)*100 AS Precio_por_pagina from libros where (PRECIO/NUM_PAGINAS)*100 > 3;
//
2ºCuestinario
select nombre,edad,nomequipo,(edad-dorsal) as diferencia from ciclista where ((nombre like "m% %") and (nomequipo like "B%")) or ((nombre like "A%") and (nomequipo like "M%"));

select dorsal,nombre,edad from ciclista where (edad - dorsal) %10 = 0;


