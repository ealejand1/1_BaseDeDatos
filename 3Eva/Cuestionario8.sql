select mar.nombre,cal.color,cal.precio,cal.talla from calzado cal join marca mar on cal.id=mar.id;


select mar.nombre,cal.color,cal.precio,cal.talla,s1.nombre,s1.color,s1.precio,s1.talla from calzado cal join marca mar join(select mar.nombre,cal.color,cal.precio,cal.talla from calzado cal join marca mar on cal.id=mar.id) as s1 on cal.id=mar.id and s1.talla=cal.talla - 5;


