A)
select cod_envio from Envios where right(dimension,2) = left(dimension,2 ) and peso >= 3 and day(fecha_compra) < 15 order by peso desc;

Mostrar los envios que fueron compradas antes de la mitad de mes y que tengas dimensiones cuadradas.Ordenalas por peso.
row 3. 

MODIFICAR
//
B)
select nombre ,date_format(fecha_publicacion,"%d-%m-%Y") as fecha_publicacion_formateada,Dayname(fecha_publicacion) as dia_semana,Monthname(fecha_publicacion) as mes,Datediff(Now(),fecha_publicacion) as dias_desde_hoy,round((datediff(now(),fecha_publicacion)/365),0) as anios_desde_hoy from Libro where fecha_publicacion between "1900-01-01" and "1975-12-31" and dayname(fecha_publicacion) = "Friday" order by fecha_publicacion desc;
rows 7

E)
select upper(concat(right(DNI,1),".",substring_index(nombre," ",1))) as cod_fich,Direccion, length(replace(Direccion," ","")) as num, replace(nombre,lower(right(DNI,1)), '*') as codigo from Empleados where replace(nombre,lower(right(DNI,1)),'*') like "%*%" and length(trim(direccion))>20 order by num desc;

Cada empleado tiene un código que será compuesto por la última letra de su DNI y su primer nombre todos en mayuscula. Ademas relevar la letra del DNI,en su nombre y poner en su lugar un *.Mostrar el numero de letras de la tienda sin contar espacios.

row 4.

/////

F)

SELECT    Cod_Envio,    peso,    DATE_FORMAT(Fecha_Compra, '%a-%b-%Y') AS fecha,    DATE_ADD(Fecha_Compra, INTERVAL 30 DAY) AS Devolucion_Disponible,  UPPER(Estado_Envio) AS estado_en_mayusculas,  CONCAT('Código: ', Cod_Envio,dayname(Fecha_Compra)) AS codigo from Envios where Cod_envio%2 = 1;

Mostrar las fechas y estado en el formato indicado, además de crear un nuevo código compuesto por; el número del código(impar) y el día que se realizó la compra.Por ultimo mostrar el ultimo dia de devolucion(30 Dias).

row 16

G)
select ISBN from Ensayo where ISBN in (select ISBN from Ejemplares where ISBN in (select ISBN from Libro where left(nombre,1) in (select left(Nombre,1) from Autor where left(Nombre,1) like "v%" or left(Nombre,1) like "p%" or left(Nombre,1) like "f%")) and Estado like "Bueno");


Seleciona los ISBN de ejemplares en buen estado que sean de Ensayo donde coincidan las iniciales de Autor y Libro siendo v,p o f.

2 ROWS//
