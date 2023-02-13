select sum(exito) from peticiones;

select date_format(max(tiempo),"%H:%i") from peticiones where tiempo_procesado > 3 and tipo_peticion like "consulta";
