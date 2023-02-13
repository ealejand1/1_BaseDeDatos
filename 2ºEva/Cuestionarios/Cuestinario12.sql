select Lower(direccion) as direc,codigo_postal as CP,poblacion as Pob,PROVINCIA as Prov,TELEFONO as Tlf,ESTADO_CIVIL as "Est. Civ" from datospersonales where poblacion != 'Madrid';

select lower(concat(NOM_AUTOR," ",APE1_AUTOR)) as Autor,concat(upper(Left(TITULO,1))+ substring(TITULO,1,length(TITULO))) from libros;


\\

select concat(left(Cliente,4),"(",left(producto,5),")") as "cli(prod)",precio_unidad from facturas where precio_unidad >= '0.25' and precio_unidad <= 1;

select concat(rpad(producto,15,'.'),":",cliente) as procli,unidades*precio_unidad as coste_total,ceil(unidades*precio_unidad / 0.50) as monedas50 from facturas;

//

select substring(producto,1,length(cliente)) as prodlen,truncate(unidades*precio_unidad,2) as coste_total from facturas  order by coste_total asc limit 10 ;

select lower(titulo) AS Titulo,concat(left(NOM_AUTOR,1),lower(substring(NOM_AUTOR,2,length(NOM_AUTOR)))) as Autor from libros where NUM_PAGINAS>200 order by lower(titulo) desc;

//
select substring(cliente,1,4) as cli4,right(producto,4) as pro4 from facturas where unidades < 6;

select concat(lower(left(TITULO,1)),upper(substring(TITULO,2,length(TITULO)))) as Titulo,LPAD(NOM_AUTOR,25,'_') AS Autor from libros;
