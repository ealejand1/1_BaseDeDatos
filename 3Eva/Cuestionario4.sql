 select de.dept_name,concat(left(emp.first_name,3),".",right(emp.last_name,3)) as ext_empleado,sal.salary,max(sal.to_date) from departments de join dept_manager man join employees emp join salaries sal on de.dept_no = man.dept_no and man.emp_no = emp.emp_no and emp.emp_no = sal.emp_no and sal.salary > 100000 and group by ext_empleado,de.dept_name,sal.salary;
//

select concat(emp.first_name," ",emp.last_name) as empleado,ti.title,sal.salary from employees emp join titles ti join salaries sal on emp.emp_no = ti.emp_no and emp.emp_no=sal.emp_no and emp.hire_date = sal.from_date and ti.title like "Senior Staff" order by sal.salary desc;

//

select depar.dept_name,concat(left(emp.first_name,3),".",right(emp.last_name,3)) as ext_empleado,sal.salary from departments depar join dept_manager de join employees emp join salaries sal on depar.dept_no=de.dept_no and de.emp_no=emp.emp_no and emp.emp_no =sal.emp_no where sal.to_date like "9999%" and sal.salary > 100000;

select concat(left(emp.first_name,1),".",left(emp.last_name,3)) as cod_emp,ti.title,ti.from_date,ti.to_date from employees emp join titles ti on emp.emp_no=ti.emp_no where ti.title like "Manager" and ti.to_date like "9999%";

select concat(left(emp.first_name,1),".",left(emp.last_name,3)) as cod_emp where ti.to_date like "9999%" and ti.title like "Manager" or ti.title not like "Manager";

//
select concat(emp.first_name," ",emp.last_name) as emp,sal.salary from employees emp join salaries sal join dept_emp dept on emp.emp_no=sal.emp_no and emp.emp_no=dept.emp_no and ((year(dept.from_date) = year(sal.from_date)) and year(dept.from_date) > 2000) and sal.salary > 90000 and day(dept.from_date)= 31;

select concat(emp.first_name," ",emp.last_name) as emp,ti.title,sal.salary from employees emp join titles ti join salaries sal on emp.emp_no = sal.emp_no and emp.emp_no = ti.emp_no and emp.hire_date = sal.from_date where ti.title like "%Senior%" order by sal.salary desc limit 10;

