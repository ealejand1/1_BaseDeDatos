select concat(LEFT(emp.first_name,1),".",left(emp.last_name,3)) as cod_emp,ti.title from employees emp join titles ti join dept_manager de on emp.emp_no=ti.emp_no and emp.emp_no=de.emp_no where de.to_date like "9999%" and abs(timestampdiff(year,emp.hire_date,de.from_date)) < 5;

//

select dep.dept_name,concat(left(emp.first_name,3),".",right(emp.last_name,3)) as ext_empleado,sal.salary from departments dep join employees emp join dept_manager de join salaries sal on dep.dept_no=de.dept_no and emp.emp_no=de.emp_no and de.emp_no=sal.emp_no where sal.to_date like "9999%" and sal.salary > 100000;
//

select concat(emp.first_name," ",emp.last_name) as emp,sal.salary from employees emp join salaries sal join dept_emp de on emp.emp_no=sal.emp_no and sal.emp_no=de.emp_no where sal.salary > 90000 and year(sal.from_date)=year(de.from_date) and year(de.from_date) > 2000 and day(de.from_date) = 31;
//
select concat(emp.first_name," ",emp.last_name) as emp,ti.title,sal.salary from employees emp join titles ti join salaries sal on emp.emp_no=sal.emp_no and emp.emp_no=ti.emp_no and emp.hire_date=sal.from_date where ti.title like "%Senior%" order by sal.salary desc limit 10;
