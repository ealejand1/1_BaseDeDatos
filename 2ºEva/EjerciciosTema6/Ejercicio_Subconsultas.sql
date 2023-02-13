select count(*) from t_empleados where salario_base_empleado < (select avg(salario_base_empleado) from t_empleados);

select nombre_departamento from t_departamentos where codigo_departamento = (select codigo_departamento from t_empleados order by salario_base_empleado desc limit 1);

select codigo_empleado,nombre_empleado from t_empleados where year(fecha_ingreso_empleado) >= 1980 and year(fecha_ingreso_empleado) <= 1989 and codigo_departamento in (select codigo_departamento from t_departamentos where presupuesto_departamento < 10000);


select codigo_centro from t_centros where ubicacion like "%ATOCHA%";

select codigo_departamento from t_departamentos where codigo_centro = 20;

select nombre_empleado,codigo_empleado from t_empleados where codigo_centro = 20;
