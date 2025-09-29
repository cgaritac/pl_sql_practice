declare

v_departamento departments.department_name%type;

begin

select d.department_name
into v_departamento
from departments d
where d.department_id = 250;

case v_departamento
when 'Operations' then
    dbms_output.put_line('El departamento se encuentra en el piso 4');
when 'IT Support' then
    dbms_output.put_line('El departamento se encuentra en el piso 3');
when 'NOC' then
    dbms_output.put_line('El departamento se encuentra en el piso 3');
when 'IT Helpdesk' then
    dbms_output.put_line('El departamento se encuentra en el piso 3');
when 'Government Sales' then
    dbms_output.put_line('El departamento se encuentra en el piso 2');
else
    dbms_output.put_line('El departamento se encuentra en el piso 1');
end case;

end;