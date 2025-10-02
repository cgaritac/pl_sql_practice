declare

v_busqueda employees.first_name%type;
v_telefono employees.phone_number%type;
v_cantidad number;
v_resultado number;
v_codigo_exception number;
v_mensaje_exception varchar(50);

begin

v_busqueda := 'John';

v_resultado := 1/0;

select e.phone_number
into v_telefono
from employees e
where e.first_name = v_busqueda;

dbms_output.put_line('El telefono de: '||v_busqueda||'es: '||v_telefono||v_resultado);

exception 
when TOO_MANY_ROWS then

select count(*)
into v_cantidad
from employees e
where e.first_name = v_busqueda;

dbms_output.put_line('Hay '||v_cantidad||' empleados con ese nombre');

when NO_DATA_FOUND then

dbms_output.put_line('No hay ningun empleado con ese nombre');

when OTHERS then

v_codigo_exception := SQLCODE;
v_mensaje_exception := SQLERRM;

dbms_output.put_line('Hubo un error: '||v_codigo_exception||', '||v_mensaje_exception);

end;