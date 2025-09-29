set serveroutput on;

Declare 

v_salary number;

begin

select e.salary
into v_salary
from employees e
where e.employee_id = 202;

if v_salary > 1000 and v_salary < 5000 then
    dbms_output.put_line('Empleado de categoria C');
elsif v_salary > 5000 and v_salary <= 10000 then
    dbms_output.put_line('Empleado de categoria B');
else
    dbms_output.put_line('Empleado de categoria A');
end if;

end;

Declare 

v_salary number;

begin

select e.salary
into v_salary
from employees e
where e.employee_id = 202;

if v_salary between 1000 and 5000 then
    dbms_output.put_line('Empleado de categoria C');
elsif v_salary between 5000 and 10000 then
    dbms_output.put_line('Empleado de categoria B');
else
    dbms_output.put_line('Empleado de categoria A');
end if;

end;