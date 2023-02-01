select codigo_cliente,max(month(tiempo)) as mes,max(tiempo) as ultima,min(tiempo) as primera from peticiones group by codigo_cliente order by mes;

//

select codigo_cliente,month(tiempo) as mes,sum(exito) as peticion from peticiones group by codigo_cliente,mes having peticion < 4000 order by mes;
