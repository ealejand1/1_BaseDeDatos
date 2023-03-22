A)Mostrar los libros que fueron comprados en dias impares pero que el dia de su publicacion sea par y viceversa.Ademas muestra los que tengas mas de 100 años desde su publicacion


select distinct li.nombre,date_format(en.Fecha_Compra,"%Y-%m-%d")  as Compra ,date_format(li.Fecha_Publicacion,"%Y-%m-%d") as Fecha_Publicacion,abs(timestampdiff(YEAR,en.Fecha_Compra,li.Fecha_Publicacion)) as anios_diferencia from Libro li join Ejemplares ej join Envios en on li.ISBN=ej.ISBN and ej.Cod_Envio=en.Cod_Envio where ((day(en.Fecha_Compra)%2 = 0  and day(li.Fecha_publicacion) % 2 != 0) or (day(en.Fecha_Compra)%2 != 0  and day(li.Fecha_publicacion) % 2 = 0)) and abs(timestampdiff(YEAR,en.Fecha_Compra,li.Fecha_Publicacion)) > 100 order by anios_diferencia desc;

FACIL

B)Muestra los DNI de los clientes que fueron atendidos por un empleado con la misma letra del DNI,y que compraron un libro con defectos cuyo ISBN es par y está apunto de recibir el libro.

select compv.DNI_Cliente,compv.ISBN,emp.nombre,emp.DNI,li.nombre,ej.Estado,env.Estado_envio from Empleados emp join CompraVenta compv join Ejemplares ej join Libro li join Envios env on emp.DNI=compv.DNI and compv.ID_Ejemplar=ej.ID_ejemplar and ej.ISBN=li.ISBN and ej.Cod_Envio=env.Cod_Envio where ej.Estado like "Con%" and compv.ISBN % 2 = 0 and right(compv.DNI_Cliente,1) = right(emp.DNI,1) and env.Estado_Envio like "En%";

C)Muestra la direccion,cantidad y el ISBN de los ejemplares que tengan la misma cantidad que su media,??

select Contiene.direccion,Contiene.cantidad,concat(left(Ejemplares.ISBN,6),"-",right(Ejemplares.ISBN,6),"(",substring(Ejemplares.ISBN,7,1),")") as ISBN from Secciones join Contiene on Secciones.ID_Secc=Contiene.ID_sec join Ejemplares on Ejemplares.ID_ejemplar=Contiene.Id_ejemplar where length(Contiene.direccion) > 20 and Contiene.cantidad in (select truncate(avg(cantidad),0) from Contiene) group by Contiene.direccion,Ejemplares.ISBN,Contiene.cantidad having direccion like "Calle%" and direccion like "%1%";


D)Selecciona la cantidad de novelas,la fecha de envio,ademas del promedio de los dias que fueron publicadas y la suma de los pesos que ya esten entragados.

select en.Fecha,avg(day(l.fecha_publicacion)) as fecha_promedio,count(distinct e.ISBN) as numero,sum(en.peso) as peso_total from Ejemplares e join Envios en join Libro l join Novela n on e.ISBN=n.ISBN and e.Cod_Envio=en.Cod_envio and e.ISBN=l.ISBN and en.Estado_Envio like "Entregado" group by en.Fecha;


E)

