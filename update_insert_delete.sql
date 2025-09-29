DECLARE

v_salario_max number; --No hay distincion entre mayusculas y minusculas en las variables

BEGIN

SELECT MAX(SALARY)
INTO V_SALARIO_MAX
FROM EMPLOYEES;

dbms_output.put_line(v_salario_max);

--El salario estaba en 24000 pero cuando se ejecuta con el update y luego se vuelve a correr cambia a 23500
--update employees set salary = 23500 where salary = v_salario_max;



END;

DECLARE

v_region_id number;
v_country_name varchar(10);

BEGIN

SELECT region_id
INTO v_region_id
FROM regions
where region_name='Asia';

v_country_name := 'Korea';

insert into countries(country_id,country_name,region_id) values ('KR', v_country_name,v_region_id);

END;

select * from countries;

DECLARE

v_country_id varchar(2);

BEGIN

SELECT country_id
INTO v_country_id
FROM countries
where country_name='Korea';

delete from countries where country_id = v_country_id;

END;