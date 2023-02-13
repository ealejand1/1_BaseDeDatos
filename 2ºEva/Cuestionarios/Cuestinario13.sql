select numerorem,numerodes,date_format(finicio,"%d de %m de %Y")as finicio,date_format(ffin,"%d de %m de %Y") as fin from llamada where timestampdiff(MINUTE,finicio,ffin) >= 10;

select numerorem,numerodes,date_format(finicio,"%d de %m de %Y")as finicio,date_format(ffin,"%d de %m de %Y") as fin from llamada where timestampdiff(MINUTE,finicio,ffin) > 10 and abs(right(numerorem,3) - right(numerodes,3))> 3 ;

//

select 
