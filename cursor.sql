declare

v_cantidad number;
v_afecto boolean;
v_afecto_txt varchar(25);
v_salario employees.salary%type;

begin

update employees e
set e.salary = e.salary*1.5
where e.department_id = 20;

v_cantidad := sql%rowcount;
v_afecto := sql%found;

case v_afecto
    when true then v_afecto_txt := 'Si';
    when false then v_afecto_txt := 'No';
end case;

dbms_output.put_line('Se afectaron filas?: '|| v_afecto_txt);
dbms_output.put_line('Cantidad de filas afectadas: '||v_cantidad);

select e.salary
into v_salario
from employees e
where e.employee_id = 201;

v_cantidad := sql%rowcount;
v_afecto := sql%found;

case v_afecto
    when true then v_afecto_txt := 'Si';
    when false then v_afecto_txt := 'No';
end case;

dbms_output.put_line('Se encontraron filas?: '|| v_afecto_txt);
dbms_output.put_line('Cantidad de filas encontradas: '||v_cantidad);

end;
commit