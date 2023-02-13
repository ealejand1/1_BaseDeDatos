select codigo_cliente,max(month(tiempo)) as mes,max(tiempo) as ultima,min(tiempo) as primera from peticiones group by codigo_cliente order by mes;

//

select codigo_cliente,month(tiempo) as mes,sum(exito) as peticion from peticiones group by codigo_cliente,mes having peticion < 4000 order by mes;
//

select tipo_peticion,avg(tiempo_procesado)as tiempo_medio,count(exito) as aceptadas from peticiones where codigo_cliente like "ES%" group by tipo_peticion,exito having exito = 1;

select month(tiempo) as mes,left(codigo_cliente,2) as pais,tipo_peticion,count(exito) as fallidas,sum(tiempo_procesado) as tiempo from peticiones where exito = 0 group by mes,pais,tipo_peticion,exito having tiempo > 300 order by pais,tiempo desc;
//

select codigo_cliente,month(tiempo)as mes,truncate(sum(0.01+(numero_ficheros*0.005)+(megabytes_ficheros*0.005)),2) as coste from peticiones where (tipo_peticion like "insercion" or tipo_peticion like "actualizacion") and exito =1 group by codigo_cliente,mes order by mes;

select codigo_cliente,count(exito) as fracasos from peticiones where exito=0 and (tipo_peticion like "consulta")group by codigo_cliente,exito having fracasos < 800 order by fracasos desc;
