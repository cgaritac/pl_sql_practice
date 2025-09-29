declare

v_job_id employees.job_id%type; --Esto define el tipo de la variable como igual al tipo que esta para es campo en la DB

begin

select e.job_id
into v_job_id
from employees e
where e.employee_id = 134;

dbms_output.put_line(v_job_id);

end;