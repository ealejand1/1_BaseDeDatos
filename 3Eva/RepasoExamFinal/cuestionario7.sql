BOLSA 2 

select c.talla,year(p.fnac)as anio,count(*) from calzado c join llevar l on l.calzado=c.id join persona p on p.id=l.pers group by c.talla,anio having count(*) >= 3 order by c.talla;\
//

select distinct(day(l.fecha)) as dia,sum(p.precio+c.precio+cal.precio) as suma from llevar l join pantalon p join calzado cal join camiseta c on l.pantalon=p.id and l.camiseta=c.id and l.calzado=cal.id group by dia;
//

select per.nombre,max(p.precio + c.precio + cal.precio) as precio from llevar l join pantalon p join camiseta c join calzado cal join persona per on l.pantalon=p.id and l.camiseta=c.id and l.calzado=cal.id and per.id=l.pers group by per.nombre;
//
