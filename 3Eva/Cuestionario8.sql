select mar.nombre,cal.color,cal.precio,cal.talla from calzado cal join marca mar on cal.id=mar.id;


select mar.nombre,cal.color,cal.precio,cal.talla,s1.nombre,s1.color,s1.precio,s1.talla from calzado cal join marca mar join(select mar.nombre,cal.color,cal.precio,cal.talla from calzado cal join marca mar on cal.id=mar.id) as s1 on cal.id=mar.id and s1.talla=cal.talla - 5;

/////

select p1.nombre,p1.fnac as fecha1,p2.nombre,p2.fnac as fecha2 from persona p1 join persona p2 on month(p1.fnac) = month(p2.fnac) where p1.nombre > p2.nombre;
//

select p2.nombre,p.nombre,count(*) from llevar ll join llevar ll2 join calzado cal join marca m join persona p join persona p2 on ll.calzado=cal.id and ll.calzado=ll2.calzado and cal.marca=m.id and p.id=ll.pers and p.id!=p2.id and p2.id=ll2.calzado where m.nombre like "Nike" and p.nombre>p2.nombre group by p.nombre,p2.nombre;


select p2.nombre,p1.nombre,count(*) as veces from persona p1 join persona p2 join llevar ll1 join llevar ll2 join calzado cal join calzado cal2 join marca m on p1.id=ll1.pers and p2.id=ll2.pers and ll1.calzado=cal.id and ll2.calzado=cal2.id and cal.id=cal2.id and cal.marca=m.id and ll1.pers != ll2.pers where m.nombre like "Nike" and ll1.pers > ll2.pers group by p1.nombre,p2.nombre having count(*)>1 order by p2.nombre,p1.nombre;

//

select p1.precio,m.nombre,p2.precio,m2.nombre from pantalon p1 join pantalon p2 join marca m join marca m2 on p1.precio>p2.precio * 2 and m.id=p1.marca and m2.id=p2.marca;

select p2.nombre,p1.nombre,count(*) as veces from persona p1 join persona p2 join llevar ll1 join llevar ll2 join calzado cal join calzado cal2 join marca m on p1.id=ll1.pers and p2.id=ll2.pers and ll1.calzado=cal.id and ll2.calzado=cal2.id and cal.id=cal2.id and cal.marca=m.id and ll1.pers != ll2.pers where m.nombre like "Nike" and ll1.pers > ll2.pers group by p1.nombre,p2.nombre having count(*)>1 order by p2.nombre,p1.nombre;








