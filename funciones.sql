set serveroutput on;

select upper(last_name)
from employees;

declare

v_last_name varchar2(25);

begin

select lower(e.last_name)
into v_last_name
from employees e
where employee_id = 100;

dbms_output.put_line(v_last_name);

end;

declare

v_last_name varchar2(25);
v_last_name_mayusculas varchar(25);
v_last_name_minusculas varchar(25);
v_last_name_substring varchar(25);
v_last_name_replace varchar(25);

begin

v_last_name := 'fernandez';
v_last_name_mayusculas := upper(v_last_name);
v_last_name_substring := substr(v_last_name_mayusculas,2,4); --El primer numero es el caracter desde el que parte y el segundo cuando caracteres debe tener
v_last_name_minusculas := lower(v_last_name);
v_last_name_replace := replace(v_last_name_minusculas,'nde','aaa');

dbms_output.put_line(v_last_name_mayusculas || ' ' || v_last_name_substring || ' ' || v_last_name_replace);

end;

declare

v_fecha date;
v_fecha2 date;

begin

v_fecha := sysdate;
v_fecha2 := last_day(v_fecha);


dbms_output.put_line(v_fecha2);

end;

declare

v_fecha date;
v_fecha2 date;
v_fecha_texto varchar(25);
v_fecha_convertida date;
v_fecha_recortada varchar(25);
v_numero_decimal number;
v_numero_decimal2 number;
v_comision varchar(20);

begin

v_fecha := date'2000-12-25';
v_fecha2 := date'2001-02-28';

v_fecha_texto := '10/12/2000';
v_fecha_convertida := to_date(v_fecha_texto, 'dd/mm/yyyy');
v_fecha_convertida := v_fecha_convertida+1;
v_fecha_convertida := last_day(v_fecha_convertida);
v_fecha_recortada := to_char(v_fecha,'dd-mm');


dbms_output.put_line(months_between(v_fecha2, v_fecha));
dbms_output.put_line(v_fecha_texto);
dbms_output.put_line(v_fecha_convertida);
dbms_output.put_line(v_fecha_recortada);

v_numero_decimal := 10.543224;
--v_numero_decimal2 := trunc(v_numero_decimal)+1;
v_numero_decimal2 := ROUND(v_numero_decimal); --el comando ROUND debe ir siempre en mayusculas

dbms_output.put_line(v_numero_decimal2);

select nvl(to_char(e.commission_pct), 'No tiene porcentaje') --Esto es para manejar los casos cuando es nulo
into v_comision
from employees e
where e.employee_id = 129;

dbms_output.put_line(v_comision);

end;