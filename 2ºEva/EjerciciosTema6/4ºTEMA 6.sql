1º 
select nombrepuerto,truncate(altura/pendiente,1) AS dificultad from puerto where numEtapa % 2 = 0 order by dificultad desc;

2º
select salida,abs(numetapa-dorsal) as diferencia ,kms from etapa where sqrt(kms)<13 ;

3º

select fecha_fac,producto,unidades,ceil(unidades/12) as num_paquetes,abs(unidades-(ceil(unidades/12)*12)) as hueco_ultimo_paquete from facturas where unidades<36 order by fecha_fac desc;
