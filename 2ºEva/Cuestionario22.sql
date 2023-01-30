select codigo_cliente,sum(tiempo_procesado) as tiempo_procesado from peticiones group by codigo_cliente;
//

select hour(tiempo) as hora,count(id_peticion) as num_peticiones from peticiones group by hora order by hora;

select codigo_cliente,max(tiempo_procesado) as max_t,max(megabytes_ficheros) as max_f,min(tiempo_procesado) as min_t,min(megabytes_ficheros)as min_f from peticiones  where codigo_cliente like 'ES%' group by codigo_cliente;
