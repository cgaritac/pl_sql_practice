set SERVEROUTPUT ON;

declare

cursor empleados is
select e.*
from employees e
where e.commission_pct is null and e.hire_date <= date'2005-12-31'
for update;

v_porcentaje_comision number;

begin
    for emp in empleados loop
    
        v_porcentaje_comision := 0;
        
        if emp.salary between 1000 and 5000 then
            v_porcentaje_comision := 0.1;
        elsif emp.salary between 5001 and 10000 then
            v_porcentaje_comision := 0.2;
        elsif emp.salary >10001 then
            v_porcentaje_comision := 0.3;
        end if;
        
        dbms_output.put_line('Empleado: '||emp.last_name||', '||emp.first_name||'. Con ID: '||emp.employee_id||'. Califica para recibir porcentaje de comision');
        dbms_output.put_line('Porcentaje asignado: '||v_porcentaje_comision||'%');
        
        update employees set commission_pct = v_porcentaje_comision
        where current of empleados;
    end loop;

end;