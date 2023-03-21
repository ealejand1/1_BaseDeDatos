A)Mostrar los libros que fueron comprados en dias impares pero que el dia de su publicacion sea par y viceversa.Ademas muestra los que tengas mas de 100 años desde su publicacion


(LETRA MAYUS DESPUES DE ESPACIO)POSIBLE DIFICIL

select distinct li.nombre,date_format(en.Fecha_Compra,"%Y-%m-%d")  as Compra ,date_format(li.Fecha_Publicacion,"%Y-%m-%d") as Fecha_Publicacion,abs(timestampdiff(YEAR,en.Fecha_Compra,li.Fecha_Publicacion)) as anios_diferencia from Libro li join Ejemplares ej join Envios en on li.ISBN=ej.ISBN and ej.Cod_Envio=en.Cod_Envio where ((day(en.Fecha_Compra)%2 = 0  and day(li.Fecha_publicacion) % 2 != 0) or (day(en.Fecha_Compra)%2 != 0  and day(li.Fecha_publicacion) % 2 = 0)) and abs(timestampdiff(YEAR,en.Fecha_Compra,li.Fecha_Publicacion)) > 100 order by anios_diferencia desc;

FACIL
B)Seleciona los DNI de los clientes que hayan sido atendidos por un empleado que tenga la misma la letra del DNI, y que haya comprado un libro con desperfectos, con el isbn sea par y que este apunto de entregarse.

Muestra los DNI de los clientes que fueron atendidos por un empleado con la misma letra del DNI,y que compraron un libro con defectos cuyo ISBN es par y está apunto de recibir el libro.

select compv.DNI_Cliente,compv.ISBN,emp.nombre,emp.DNI,li.nombre,ej.Estado,env.Estado_envio from Empleados emp join CompraVenta compv join Ejemplares ej join Libro li join Envios env on emp.DNI=compv.DNI and compv.ID_Ejemplar=ej.ID_ejemplar and ej.ISBN=li.ISBN and ej.Cod_Envio=env.Cod_Envio where ej.Estado like "Con%" and compv.ISBN % 2 = 0 and right(compv.DNI_Cliente,1) = right(emp.DNI,1) and env.Estado_Envio like "En%";


