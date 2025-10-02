set serveroutput on;

declare

cursor empleados(p_desde date,p_hasta date) is 
select e.first_name, e.last_name, e.hire_date
from employees e
where e.hire_date between p_desde and p_hasta;

v_desde date;
v_hasta date;

begin
    v_desde := date'1997-01-01';
    v_hasta := date'1998-12-31';

    for reg in empleados(v_desde,v_hasta) loop
        
        dbms_output.put_line('Nombre: '||reg.first_name||' Apellido: '||reg.last_name||' Contr: '||reg.hire_date);
    
    end loop;
end;

declare

cursor empleados(p_desde date,p_hasta date) is 
select e.first_name, e.last_name, e.hire_date
from employees e
where e.hire_date between p_desde and p_hasta;

v_desde date;
v_hasta date;

begin
    v_desde := date'1997-01-01';
    
    select max(hire_date)
    into v_hasta
    from employees
    where department_id = 100;

    for reg in empleados(v_desde,v_hasta) loop
        
        dbms_output.put_line('Nombre: '||reg.first_name||' Apellido: '||reg.last_name||' Contr: '||reg.hire_date);
    
    end loop;
end;