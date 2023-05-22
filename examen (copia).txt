11-Muestra cuántos títulos obtenidos antes de 1994 hay por departamento, indicando el nombre del título y del departamento. Se han de mostrar los departamentos que no sean Development y de los títulos que haya menos de 20 o más de 5000.

select t.title,d.dept_name,count(*) as num from titles t join dept_emp de join departments d join employees e on t.emp_no=e.emp_no and e.emp_no=de.emp_no and de.dept_no=d.dept_no where year(t.to_date) < 1994 and d.dept_name not like "Development" group by t.title,d.dept_name having num <= 20 or num >=5000;
//

1,1 D

7-Muestra los empleados (con dos letras del nombre y el apellido separado por punto), su cumpleaños (según formato del resultado), los años que lleva (o diferentes salarios que ha tenido), así como su salario máximo y su salario mínimo. Mostrar solo los que han tenido más de 12 salarios, que su último salario acabe en 2002 y que el salario más alto sea más del doble que el salario más bajo.

select concat(left(e.first_name,2),".",e.last_name)as empleado,date_format(e.birth_date,"%d de %M")as cumple,t1.num as anios,t2.ma as maxsal,t3.mi as minsal from employees e join (select e.emp_no,count(*) as num from employees e join salaries s on e.emp_no=s.emp_no join (select emp_no,max(to_date)as da from salaries group by emp_no) as t1 on t1.emp_no=e.emp_no where year(t1.da) = 2002 group by e.emp_no having num > 12) as t1 on t1.emp_no=e.emp_no join (select emp_no,max(salary) as ma from salaries group by emp_no) as t2 on t2.emp_no=e.emp_no join (select emp_no,min(salary) as mi from salaries group by emp_no)as t3 on t3.emp_no = e.emp_no where (t3.mi * 2) < t2.ma;

1,6 D

12-Muestra el apellido e inicial del nombre (con el formato de la tabla resultado) de los empleados nacidos en 1965, contratados en 1987, que contengan la letra w en su nombre y que hayan tenido más de 15 nóminas diferentes.

select concat(e.last_name," ",left(e.first_name,1),".")as empleado from employees e join (select emp_no from salaries group by emp_no having count(*) > 15)as t1 on t1.emp_no=e.emp_no where year(e.birth_date) = 1965 and year(e.hire_date) = 1987 and e.first_name like "%w%";

1,4 D

8-Selecciona el correo electrónico (que se forma con las tres primeras letras del nombre y del apellido, seguido de arroba corp.com), la edad y el año en el que se incorporaron a la empresa, así como su primer salario, de los empleados que fueron contratados con menos de dos días de diferencia respecto a cuando obtuvieron su titulación.


select concat(left(e.first_name,3),".",left(e.last_name,3),"@corp.com")as emp,timestampdiff(year,e.birth_date,e.hire_date)as edad_incorp,year(e.hire_date) as anio_incorp,t2.salario from employees e join (select s.emp_no,s.salary as salario from salaries s join (select emp_no,min(from_date)as mi from salaries group by emp_no) as t1 on t1.emp_no =s.emp_no where s.from_date =t1.mi) as t2 on e.emp_no=t2.emp_no join (select emp_no,max(to_date)as saca from titles where to_date not like "%9999%" group by emp_no)as t3 on t3.emp_no=e.emp_no where timestampdiff(day,e.hire_date,t3.saca) < 2;
0,9 D

3

delimiter //
drop table if exists salamax;
create table salamax(
dept_name varchar(40),
salary1 int,
salary2 int,
salary3 int);

drop procedure if exists max3;
create procedure max3();
begin

declare d_reco varchar(40);
declare departamentos varchar(40);
declare recorrido int default 0;

declare salario_reco int default 0;
declare salario1 int default 0;
declare salario2 int default 0;
declare salario2 int default 0;


declare done boolean default false;
declare c1 for select d.dept_name,sal.salary from departments d join dept_emp de join salaries sal on d.dept_no=de.dept_no and de.emp_no=sal.emp_no order by d.dept_name,sal.salary desc;
declare continue handler for SQLSTATE '02000' set done = true;

open c1;
c1_loop:LOOP
        
        fetch c1 into departamentos,salario_reco;
        if done then
        leave c1_loop;
        end if;
        if d_reco != departamentos then
        set d_reco=departamentos;
        set salario1=salario_reco;
        end if;

end LOOP c1_loop;
close c1;
end //
delimiter ;


1-Se ha descubierto que hay empleadas que han sido pareja de empleados si han nacido en el mismo mes del mismo año (no tiene por qué ser el mismo día), del mes y año en el que menos empleados han nacido. Además coincide la inicial de sus nombres y el departamento para el que trabajan.
Mostrar el nombre del departamento, el nombre y la inicial del apellido de la empleada y a su derecha el del empleado.
Atención, la consulta puede tardar en ejecutarse entre 10 y 20 segundos

select year(e.birth_date),min(t1.num) from employees e join (select year(birth_date)as a,month(birth_date)as m,count(*)as num from employees group by year(birth_date),month(birth_date))as t1 on year(e.birth_date) = t1.a and month(e.birth_date) = t1.m group by year(e.birth_date) order by year(e.birth_date);

1,8











