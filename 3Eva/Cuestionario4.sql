select de.dept_name,concat(left(emp.first_name,3),".",right(emp.last_name,3)) as ext_empleado,sal.salary,max(sal.to_date) from departments de join dept_manager man join employees emp join salaries sal on de.dept_no = man.dept_no and man.emp_no = emp.emp_no and emp.emp_no = sal.emp_no and sal.salary > 100000 and group by ext_empleado,de.dept_name,sal.salary;
//

select concat(emp.first_name," ",emp.last_name) as empleado,ti.title,sal.salary from employees emp join titles ti join salaries sal on emp.emp_no = ti.emp_no and emp.emp_no=sal.emp_no and emp.hire_date = sal.from_date and ti.title like "Senior Staff" order by sal.salary desc;


