declare

v_busqueda employees.first_name%type;
v_telefono employees.phone_number%type;
v_cantidad number;

begin

v_busqueda := 'Carlos';

select e.phone_number
into v_telefono
from employees e
where e.first_name = v_busqueda;

dbms_output.put_line('El telefono de: '||v_busqueda||'es: '||v_telefono);

exception 
when TOO_MANY_ROWS then

select count(*)
into v_cantidad
from employees e
where e.first_name = v_busqueda;

dbms_output.put_line('Hay '||v_cantidad||' empleados con ese nombre');

when NO_DATA_FOUND then

dbms_output.put_line('No hay ningun empleado con ese nombre');

end;