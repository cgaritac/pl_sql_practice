declare

v_job jobs%rowtype;
v_desc jobs.job_title%type;
v_min_salary jobs.min_salary%type;

begin

select J.*
into v_job
from JOBS J
where J.JOB_ID = 'IT_PROG';

v_desc := v_job.job_title;
v_min_salary := v_job.min_salary;

dbms_output.put_line('Para el trabajo con titulo ' || v_desc || ' el salario minimo es ' || v_min_salary);

end;

declare

v_new_job jobs%rowtype;

begin

v_new_job.job_id := 'DBA';
v_new_job.job_title := 'DB Admin';
v_new_job.min_salary :=6000;
v_new_job.max_salary := 11000;

update jobs SET row = v_new_job where job_id = 'DBA';

end;