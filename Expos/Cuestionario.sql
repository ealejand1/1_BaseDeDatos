select nombre_juego from Videojuegos where left(nombre_juego,1) = "P" and (nombre_juego like "%a%" and nombre_juego like "%o%") and precio < 100 and (year(fecha_lanz) >= 2019 and year(fecha_lanz) <=2022);
//

select substring_index(nombre_juego," ",1) as Videojuegos from Pertenece group by nombre_juego having group_concat(nombre_genero) like "%Accion%" and group_concat(nombre_genero) like "%Aventura%";
//

select concat(nombre,",",apellidos) from Persona where ID in (select ID_persona from Compra where nombre_t in (select nombre_t from Tienda where tipo like "fisica"));


