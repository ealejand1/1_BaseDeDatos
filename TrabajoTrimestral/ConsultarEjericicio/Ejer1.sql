select cod_envio from Envios where right(dimension,2) = left(dimension,2 ) and peso >= 3 and day(fecha_compra) < 15;

Mostrar los envios que tengan las mismas medidas, y que hayan sido compradas antes de la mitad de mes y ordenado por peso.
