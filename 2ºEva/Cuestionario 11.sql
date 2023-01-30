1º 
select fecha_fac,producto,unidades from facturas where unidades % 12 = 0 order by fecha_fac;
2º
select rpad(NOM_AUTOR,25,'.') from libros;


///////////

1º
select num,unidades,num-unidades as val_signo,abs(num-unidades) as val_absoluto from facturas where unidades>2*num;
2º 
select upper(fiesta) from fechas where month(FECHA_CE)<8;
