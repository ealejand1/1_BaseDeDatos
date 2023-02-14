A) Seleciona los Libros(con el formato indicado) donde el ISBN sea impar y que estan escritos en los años 1960 y 1980. Ordenalos por año de publicacion y por Nombre.

select concat(left(upper(nombre),2),substring(lower(nombre),3,length(nombre))) as Nombre, ISBN,year(fecha_publicacion) as an from Libro where ISBN%2 != 0 and (year(fecha_publicacion) = 1960 or year(fecha_publicacion) = 1980) and locate(" ",nombre) > 1 order by an desc,Nombre;

Resultado:2

B) Mostrar el nombre de los libros los cuales hayan sido publicados hace mas de 50 años,un viernes y las tablas de los dias y años que han pasado.

select nombre, date_format(fecha_publicacion,"%a-%b-%Y") as fecha_escrita, dayname(fecha_publicacion) as dia_semana, datediff(curdate(),fecha_publicacion) as dias_desde_hoy,round(datediff(curdate(),fecha_publicacion)/365) as anios_pasados from Libro where year(fecha_publicacion) < 1973 and dayname(fecha_publicacion) = "Friday" order by anios_pasados desc;

RESULTADO:7

C) Selecciona el ISBN (añadiendo 2 "X" en cada lado), los ID denominalos Puntos,la diferencia entre ID y el Codigo llamalo votos,y otra columna llamada rating que reparte el doble de puntos entre votos. Se seleccionaran los que tengan un rating entre 4 y 5 ,ordenandolo por el mismo de mayor a menor.

select concat(lpad(ISBN,15,"X"),(rpad(ISBN,15,"X"))) as ISBN, ID_ejemplar as Puntos, (ID_ejemplar-Cod_envio) as Votos, truncate((ID_ejemplar*2/(ID_ejemplar-Cod_envio)),1) as rating from Ejemplares where (ID_ejemplar*2/(ID_ejemplar-Cod_envio)) between 4 and 5 order by rating desc;

RESULTADO:7

D)Mostrar los ejemplares que tiene cada libro siendo mas de uno en buen estado.

select count(*) as Num,ISBN,group_concat(Estado) as Estados from Ejemplares group by ISBN having Num > 1 and Estados like "%Bueno%Bueno%" order by Num;

Resultado:7

E)Cada empleado tiene un código que será compuesto por la última letra de su DNI y su primer nombre todos en mayuscula. Ademas relevar la letra del DNI,en su nombre y poner en su lugar un *.Mostrar el numero de letras de la tienda sin contar espacios.

select upper(concat(right(DNI,1),".",substring_index(nombre," ",1))) as Cod_fich,Direccion, length(replace(Direccion," ","")) as Num, replace(nombre,lower(right(DNI,1)), '*') as Codigo from Empleados where replace(nombre,lower(right(DNI,1)),'*') like "%*%" and length(trim(direccion))>20 order by Num desc;

Resultado:4.


F)Mostrar los codigos,fechas y estado en el formato indicado, además de crear un nuevo código compuesto por el número del código (impar) y el día que se realizó la compra.Por ultimo mostrar el ultimo dia de devolucion(30 Dias).

SELECT    Cod_Envio,    DATE_FORMAT(Fecha_Compra, '%d-%a-%b-%Y') AS fecha,    DATE_ADD(Fecha_Compra, INTERVAL 30 DAY) AS Devolucion_Disponible,  UPPER(Estado_Envio) AS estado_en_mayusculas,  CONCAT('Código: ', Cod_Envio,dayname(Fecha_Compra)) AS codigo from Envios where Cod_envio%2 = 1;

Resultado:16

G)Seleciona los ISBN de ejemplares en buen estado que sean de Ensayo donde coincidan las iniciales de Autor y Libro siendo v,p o f.

select ISBN from Ensayo where ISBN in (select ISBN from Ejemplares where ISBN in (select ISBN from Libro where left(nombre,1) in (select left(Nombre,1) from Autor where left(Nombre,1) like "v%" or left(Nombre,1) like "p%" or left(Nombre,1) like "f%")) and Estado like "Bueno");

Resultado:2
