declare

v_departamento departments.department_name%type;

begin

select d.department_name
into v_departamento
from departments d
where d.department_id = 250;

case
when v_departamento = 'Operations' then
    dbms_output.put_line('El departamento se encuentra en el piso 4');
when v_departamento in ('IT Support', 'NOC', 'IT Helpdesk') or v_departamento = 'IT' then
    dbms_output.put_line('El departamento se encuentra en el piso 3');
when v_departamento = 'Government Sales' then
    dbms_output.put_line('El departamento se encuentra en el piso 2');
else
    dbms_output.put_line('El departamento se encuentra en el piso 1');
end case;

end;