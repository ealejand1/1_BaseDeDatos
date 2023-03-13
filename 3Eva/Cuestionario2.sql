select a.nombre as rol,concat(b.nombre," ",b.apellidos) as persona ,c.nombre as ciudad from rol a join persona b join ciudad c on a.id=b.rol and b.ciudad=c.id and c.nombre like "Getafe";

select a.nombre as ciudad,concat(b.nombre," ",b.apellidos) as persona,count(*) as numero from ciudad a join persona b join rol c join profesor d join grupo e on a.id = b.ciudad and b.rol =c.id and b.id=d.idp and d.idg = e.id and c.nombre like "Director" group by a.nombre,persona;
