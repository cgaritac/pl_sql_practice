DECLARE

v_last_name VARCHAR(15);
v_f_name VARCHAR(15);
v_salary number;

BEGIN --Esta funcion devuelve los datos de un solo registro, no de muchos porque las variables creadas son para un solo registro

SELECT e.last_name, e.first_name, e.salary
INTO v_last_name, v_f_name, v_salary
FROM employees e
WHERE e.employee_id = 100;

dbms_output.put_line(v_last_name || ' ' || v_f_name || ' ' || v_salary);

END;


--Instrucción simple para corroborar los datos, no forma parte del declare
SELECT *
FROM employees
WHERE employee_id = 100;
