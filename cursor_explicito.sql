set serveroutput on;

declare

cursor empleados is 
select e.first_name, e.last_name, e.hire_date
from employees e
where e.hire_date between date'1996-01-01' and date'1998-12-31';

v_nombre varchar(25);
v_apellido varchar(25);
v_contratacion date;

begin

open empleados;

loop

    fetch empleados into v_nombre,v_apellido,v_contratacion;   
    
    exit when empleados%notfound;
    
    dbms_output.put_line('Nombre: '||v_nombre||' Apellido: '||v_apellido||' Contr: '||v_contratacion);

end loop;

close empleados;
end;