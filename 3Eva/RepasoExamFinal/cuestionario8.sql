Ej2 bolsa 1
select m.nombre,c.color,c.precio,c.talla,m2.nombre,c2.color,c2.precio,c2.talla from calzado c join calzado c2 on c.id !=c2.id and c.talla > c2.talla + 4 join marca m join marca m2 on m.id=c.marca and c2.marca=m2.id;

bolsa 2

select m.nombre,m2.nombre,m3.nombre,l.fecha,per.nombre,c.precio+cal.precio+p.precio as precio from llevar l join marca m join pantalon p on l.pantalon=p.id and p.marca=m.id join marca m2 join camiseta c on l.camiseta=c.id and c.marca=m2.id join calzado cal join marca m3 on l.calzado=cal.id and cal.marca=m3.id join persona per on per.id=l.pers where day(per.fnac) < day(l.fecha);
//


