A)


select distinct li.nombre,en.Fecha_Compra  as Compra ,li.Fecha_Publicacion,abs(timestampdiff(YEAR,en.Fecha_Compra,li.Fecha_Publicacion)) as anios_diferencia from Libro li join Ejemplares ej join Envios en on li.ISBN=ej.ISBN and ej.Cod_Envio=en.Cod_Envio where (day(en.Fecha_Compra)%2 = 0  and day(li.Fecha_publicacion) % 2 != 0) or (day(en.Fecha_Compra)%2 != 0  and day(li.Fecha_publicacion) % 2 = 0);

B)




