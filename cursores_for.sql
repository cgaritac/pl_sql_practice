set serveroutput on;

declare

cursor empleados is 
select e.first_name, e.last_name, e.hire_date
from employees e
where e.hire_date between date'1996-01-01' and date'1998-12-31';

begin

    for reg in empleados loop
        
        dbms_output.put_line('Nombre: '||reg.first_name||' Apellido: '||reg.last_name||' Contr: '||reg.hire_date);
    
    end loop;
end;