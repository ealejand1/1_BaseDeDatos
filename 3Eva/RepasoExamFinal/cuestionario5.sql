
select t1.nombre,t1.profesores,t2.alumnos from (select c.nombre,count(*)as profesores from persona p join rol r join ciudad c on p.rol=r.id and p.ciudad=c.id where r.nombre like "Profesor" group by c.nombre) as t1 join (select c.nombre,count(*) as alumnos from persona p join rol r join ciudad c on p.rol=r.id and p.ciudad=c.id where r.nombre like "Alumno" group by c.nombre) as t2 on t1.nombre=t2.nombre;
//

select concat(per.nombre," ",per.apellidos) as nombre,count(*)as alumnos from profesor p join alumno a join persona per join persona per2 on p.idg=a.idg and per.id=p.idp and per2.id =a.ida where abs(timestampdiff(year,per.fnac,per2.fnac)) <= 10 group by nombre;
//

 SELECT t1.profesores,
       t1.nombre,
       t1.curso
FROM   (
              SELECT Concat(per.nombre," ",per.apellidos) AS profesores,
                     g.id,
                     asig.nombre,
                            Concat(RIGHT(Year(c.finicio),2),"/",RIGHT(Year(c.ffinal),2)) AS curso
              FROM   profesor p
              JOIN   grupo g
              JOIN   curso c
              JOIN   persona per
              JOIN   asignatura asig
              ON     p.idg=g.id
              AND    g.curso=c.id
              AND    per.id=p.idp
              AND    g.asignatura=asig.id) AS t1
JOIN
       (
              SELECT concat(per.nombre," ",per.apellidos) AS profesores,
                     g.id,
                     asig.nombre,
                            concat(RIGHT(year(c.finicio),2),"/",RIGHT(year(c.ffinal),2)) AS curso
              FROM   profesor p
              JOIN   grupo g
              JOIN   curso c
              JOIN   persona per
              JOIN   asignatura asig
              ON     p.idg=g.id
              AND    g.curso=c.id
              AND    per.id=p.idp
              AND    g.asignatura=asig.id)AS t2
ON     t1.profesores!=t2.profesores
AND    t2.nombre=t1.nombre
AND    t1.curso=t2.curso
AND    t1.id != t2.id;
// REVISAR EJ3

select p.id,a.nota,g.asignatura,c.finicio from persona p join alumno a join grupo g join curso c on p.id=a.ida and a.idg=g.id and g.curso=c.id;

select p.id,c.finicio,avg(a.nota)from persona p join alumno a join grupo g join curso c on p.id=a.ida and a.idg=g.id and g.curso=c.id group by p.id,c.finicio;

